; DESCRIPTION: Composite: Places a purple line segment connecting (455, 156) to (337, 194) then Draws a white rectangle at (315, 88) with width 93 and height 14 then Creates a orange circular shape at (423, 180) with radius 21.
; PLAN: r0=455(x1), r1=156(y1), r2=337(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=88(y), r7=93(width), r8=14(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=423(x), r11=180(y), r12=21(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 455
LDI r1, 156
LDI r2, 337
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 88
LDI r7, 93
LDI r8, 14
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 423
LDI r11, 180
LDI r12, 21
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
