import 'package:flutter/material.dart';
import 'package:douban_app/widgets/search_text_field_widget.dart';
import 'package:douban_app/util/screen_utils.dart';

const double _kTabHeight = 46.0;
const double _kTextAndIconTabHeight = 42.0;

class MyTabBar extends StatefulWidget implements PreferredSizeWidget {
  final TabBar tabBar;
  final double translate;

  MyTabBar({Key key, this.tabBar, this.translate}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();

  @override
  Size get preferredSize {
    print('preferredSize');
    for (Widget item in tabBar.tabs) {
      if (item is Tab) {
        final Tab tab = item;
        if (tab.text != null && tab.icon != null)
          return Size.fromHeight(
              _kTextAndIconTabHeight + tabBar.indicatorWeight);
      }
    }
    return Size.fromHeight(_kTabHeight + tabBar.indicatorWeight);
  }
}

class _MyTabBarState extends State<MyTabBar> {
  double get allHeight => widget.preferredSize.height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 15.0,
          right: ScreenUtils.screenW() / 5 * 4 - 10.0,
          top: getTop(widget.translate),
          child: Container(
            padding: const EdgeInsets.only(
                top: 3.0, bottom: 3.0, right: 10.0, left: 5.0),
            decoration: BoxDecoration(
                color: const Color.fromARGB(245, 236, 236, 236),
                borderRadius: BorderRadius.all(Radius.circular(17.0))),
            child: Row(
              children: <Widget>[
                Icon(Icons.search),
                Expanded(
                  child: Align(
                    alignment: Alignment(1.0, 0.0),
                    child: Text(
                      '搜索',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: const Color.fromARGB(255, 192, 192, 192)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 3,
                child: widget.tabBar,
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        )
      ],
    );
  }

  double getTop(double translate) {
    return Tween<double>(begin: allHeight, end: 0.0)
        .transform(widget.translate);
  }
}
