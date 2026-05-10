; DESCRIPTION: Composite: Renders a purple line between points (56, 227) and (58, 125) then Renders a green box of size 75x88 starting at (206, 24) then Draws a purple circle centered at (327, 38) with radius 35.
; PLAN: r0=56(x1), r1=227(y1), r2=58(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=24(y), r7=75(width), r8=88(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=327(x), r11=38(y), r12=35(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 56
LDI r1, 227
LDI r2, 58
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 24
LDI r7, 75
LDI r8, 88
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 38
LDI r12, 35
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
