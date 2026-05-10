; DESCRIPTION: Composite: Draws a purple circle centered at (330, 49) with radius 26 then Creates a black rectangular region at (355, 113) spanning 10 by 85 pixels then Draws a orange line from (30, 39) to (147, 36).
; PLAN: r0=330(x), r1=49(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=113(y), r7=10(width), r8=85(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=30(x1), r11=39(y1), r12=147(x2), r13=36(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 49
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 113
LDI r7, 10
LDI r8, 85
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 30
LDI r11, 39
LDI r12, 147
LDI r13, 36
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
