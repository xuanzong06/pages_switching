
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

/*
這個範例的功能：
1.切換頁面到下一頁
2.從第二個畫面切回第一頁
Q:不同page傳值的概念要了解

開始在畫面中設計Container，將相關的屬性都設置一次，並註解起來。

 */
class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Row( //Row產生的Widget會預設從左邊到右邊
        // mainAxisAlignment: MainAxisAlignment.start, //default 有設定start和沒設定start都是相同的，因為預設就是start
        // mainAxisAlignment: MainAxisAlignment.center, //Row中所有Widget置中
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(onPressed : () {},
            color: Colors.amber,
            child: Text('Click ME'),
          ),
          Container(
            color: Colors.grey,
            // padding Container內元素對Container的距離
            // padding: EdgeInsets.fromLTRB(5.0, 10.0, 15.0, 20.0),
            // padding: const EdgeInsets.all(20.0),
            // padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            // margin Container本身對body元素的距離
            // margin: EdgeInsets.all(30.0),
            child: ElevatedButton(

              child: const Text('Open route'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondRoute()),
                );
              },
            ),
          ),
          Container(
            color: Colors.teal,
            child: Text('Container 2'),
          ),
          Container(
            color: Colors.orange,
            child: Text('Container 3'),
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
