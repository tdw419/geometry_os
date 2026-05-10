; DESCRIPTION: Composite: Renders a orange line between points (155, 153) and (271, 218) then Creates a magenta rectangular region at (324, 123) spanning 24 by 56 pixels then Creates a orange circular shape at (359, 44) with radius 40.
; PLAN: r0=155(x1), r1=153(y1), r2=271(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=123(y), r7=24(width), r8=56(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=359(x), r11=44(y), r12=40(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 155
LDI r1, 153
LDI r2, 271
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 123
LDI r7, 24
LDI r8, 56
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 44
LDI r12, 40
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
