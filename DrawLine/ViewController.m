//
//  ViewController.m
//  DrawLine
//
//  Created by hoangdangtrung on 5/12/16.
//  Copyright © 2016 hoangdangtrung. All rights reserved.
//

#import "ViewController.h"
#import "ViewLine.h"

@interface ViewController ()

@end

@implementation ViewController {
    ViewLine *view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self createNewViewAtX:10 atY:100 withWidth:100 andHeight:50];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(100, 100, 100, 100)];
    
    view = [self createNewViewAtX:0 atY:0 withWidth:btn.bounds.size.width andHeight:btn.bounds.size.height];
    
    view.layer.cornerRadius = view.bounds.size.width/2;
    view.layer.masksToBounds = YES;
//    view.clipsToBounds = YES;
    
    [btn addSubview:view];
//    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [btn addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];

    [btn addTarget:self action:@selector(touchUpInSide) forControlEvents:UIControlEventTouchUpInside];

//    [btn bringSubviewToFront:view];

    [self.view addSubview:btn];
}

- (void)touchDown {
    view.alpha = 0.5;
}

- (void)touchUpInSide {
    view.alpha = 1;
}

- (void)click {
    [UIView animateWithDuration:0.1 animations:^{
        view.alpha = 0.5;
    } completion:^(BOOL finished) {
        view.alpha = 1;
    }];
    
    NSLog(@"ASDASD");
}

- (ViewLine*)createNewViewAtX:(CGFloat)x atY:(CGFloat)y withWidth:(CGFloat)width andHeight:(CGFloat)height {
    
    CGRect rect = CGRectMake(x, y, width, height);
    
    ViewLine *viewLine = [[ViewLine alloc] initWithFrame:rect];

    [viewLine setUserInteractionEnabled:NO];
    return viewLine;
}

@end
