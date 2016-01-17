//
//  ViewController.m
//  masonry 应用练习
//
//  Created by 杨庆 on 16/1/17.
//  Copyright © 2016年 双元班. All rights reserved.
//

#import "ViewController.h"
/// 应用的这个框架的话 必须要求我们这要的导入
///
/// @param void 有用的宏
///
/// @return masonry 的类库
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 注意的点是: 我们应用autolayout 的同时 也需要取消我们的autosize 的操作!
    //定义一个红色的view 来显示它的frame;
    UIView * redV = [[UIView alloc]init];
    redV.backgroundColor = [UIColor redColor];
    [self.view addSubview:redV];
    
    //取消autosizing
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    redV.translatesAutoresizingMaskIntoConstraints = NO;
    
    //应用masonry 来进行的布局的应用!
    //这里的应用的是block 的代码块来设置布局的约束的,其中的make就是代表的是约束的体;
    //需求的是: 左 上 右的约束是20;高度是 50;
    [redV makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(50);
    }];
    
    //创建一个蓝色的view, 要求的是我们的right是要求的对齐的,长度的话是我们的red的一半;
    UIView *buleView = [[UIView alloc]init];
    buleView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:buleView];
    
    [buleView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(redV).multipliedBy(0.5);
        make.right.height.equalTo(redV);
        make.top.equalTo(redV.bottom).offset(20);
    }];
    
    
    
}
-(void)test2{
    UIView * redV = [[UIView alloc]init];
    redV.backgroundColor = [UIColor redColor];
    [self.view addSubview:redV];
    
    //取消autosizing
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    redV.translatesAutoresizingMaskIntoConstraints = NO;
    
    //应用masonry 来进行的布局的应用!
    //这里的应用的是block 的代码块来设置布局的约束的,其中的make就是代表的是约束的体;
    //需求的是: 我们的view和各个的边距是20;
    [redV makeConstraints:^(MASConstraintMaker *make) {
        //        //上
        //        make.top.equalTo(self.view).offset(20);
        //        //下
        //        make.bottom.equalTo(self.view).offset(-20);
        //        //左
        //        make.left.equalTo(self.view).offset(20);
        //        //右
        //        make.right.equalTo(self.view).offset(-20);
        //        //简化1:
        //        //上左
        //        make.top.left.equalTo(self.view).offset(20);
        //        //下右
        //        make.bottom.right.equalTo(self.view).offset(-20);
        //简化2:
        //直接设置内边距;
        UIEdgeInsets inset = UIEdgeInsetsMake(20, 20, 20, 20);
        make.edges.equalTo(inset);
    }];
}

-(void)test1{
    UIView * redV = [[UIView alloc]init];
    redV.backgroundColor = [UIColor redColor];
    [self.view addSubview:redV];
    [redV makeConstraints:^(MASConstraintMaker *make) {
        //注意的是 约束make == redv;
        //让redv 居中显示
        make.center.equalTo(self.view);
        make.size.equalTo(CGSizeMake(100, 100));
    }];

}


@end
