; DESCRIPTION: Composite: Places a yellow line segment connecting (110, 62) to (225, 123) then Creates a orange rectangular region at (26, 32) spanning 51 by 59 pixels then Creates a magenta circular shape at (97, 178) with radius 76.
; PLAN: r0=110(x1), r1=62(y1), r2=225(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=32(y), r7=51(width), r8=59(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=97(x), r11=178(y), r12=76(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 110
LDI r1, 62
LDI r2, 225
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 32
LDI r7, 51
LDI r8, 59
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 178
LDI r12, 76
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
