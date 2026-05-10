; DESCRIPTION: Composite: Draws a yellow circle centered at (221, 88) with radius 78 then Draws a orange line from (481, 8) to (501, 158) then Creates a yellow rectangular region at (258, 168) spanning 23 by 28 pixels.
; PLAN: r0=221(x), r1=88(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x1), r6=8(y1), r7=501(x2), r8=158(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=258(x), r11=168(y), r12=23(width), r13=28(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 88
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 8
LDI r7, 501
LDI r8, 158
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 168
LDI r12, 23
LDI r13, 28
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
