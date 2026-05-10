; DESCRIPTION: Composite: Draws a blue circle centered at (313, 135) with radius 62 then Renders a yellow box of size 14x108 starting at (41, 91) then Renders a purple line between points (79, 156) and (70, 26).
; PLAN: r0=313(x), r1=135(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=91(y), r7=14(width), r8=108(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=79(x1), r11=156(y1), r12=70(x2), r13=26(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 135
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 91
LDI r7, 14
LDI r8, 108
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 156
LDI r12, 70
LDI r13, 26
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
