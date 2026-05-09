; DESCRIPTION: Composite: Places a yellow circle of radius 29 at center (364, 156) then Draws a magenta rectangle at (119, 43) with width 114 and height 71 then Renders a purple line between points (312, 155) and (104, 161).
; PLAN: r0=364(x), r1=156(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x), r6=43(y), r7=114(width), r8=71(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=312(x1), r11=155(y1), r12=104(x2), r13=161(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 156
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 43
LDI r7, 114
LDI r8, 71
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 155
LDI r12, 104
LDI r13, 161
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
