; DESCRIPTION: Composite: Draws a orange rectangle at (31, 17) with width 62 and height 53 then Renders a purple line between points (355, 244) and (61, 27) then Draws a red circle centered at (385, 136) with radius 67.
; PLAN: r0=31(x), r1=17(y), r2=62(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x1), r6=244(y1), r7=61(x2), r8=27(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=385(x), r11=136(y), r12=67(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 17
LDI r2, 62
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 244
LDI r7, 61
LDI r8, 27
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 136
LDI r12, 67
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
