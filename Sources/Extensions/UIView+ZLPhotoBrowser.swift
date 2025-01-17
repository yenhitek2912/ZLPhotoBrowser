//
//  UIView+ZLPhotoBrowser.swift
//  ZLPhotoBrowser
//
//  Created by long on 2022/9/27.
//
//  Copyright (c) 2020 Long Zhang <495181165@qq.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

extension ZLPhotoBrowserWrapper where Base: UIView {
    var top: CGFloat {
        base.frame.minY
    }
    
    var bottom: CGFloat {
        base.frame.maxY
    }
    
    var left: CGFloat {
        base.frame.minX
    }
    
    var right: CGFloat {
        base.frame.maxX
    }
    
    var width: CGFloat {
        base.frame.width
    }
    
    var height: CGFloat {
        base.frame.height
    }
    
    var size: CGSize {
        base.frame.size
    }
    
    var snapshotImage: UIImage? {
        UIGraphicsBeginImageContextWithOptions(base.bounds.size, base.isOpaque, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        base.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func setCornerRadius(_ radius: CGFloat) {
        base.layer.cornerRadius = radius
        base.layer.masksToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        base.layer.borderColor = color.cgColor
        base.layer.borderWidth = width
    }
    
    func addShadow(color: UIColor, radius: CGFloat, opacity: Float = 1, offset: CGSize = .zero) {
        base.layer.shadowColor = color.cgColor
        base.layer.shadowRadius = radius
        base.layer.shadowOpacity = opacity
        base.layer.shadowOffset = offset
    }
}

