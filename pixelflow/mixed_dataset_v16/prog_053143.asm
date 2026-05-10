; DESCRIPTION: Composite: Renders a magenta disk with center (426, 88) and radius 34 then Creates a white rectangular region at (113, 67) spanning 97 by 119 pixels then Renders a purple line between points (28, 38) and (364, 76).
; PLAN: r0=426(x), r1=88(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=67(y), r7=97(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=28(x1), r11=38(y1), r12=364(x2), r13=76(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 88
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 67
LDI r7, 97
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 28
LDI r11, 38
LDI r12, 364
LDI r13, 76
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
