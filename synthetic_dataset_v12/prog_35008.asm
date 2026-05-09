; DESCRIPTION: Composite: Places a orange 20x77 rectangle at position (457, 102) then Draws a yellow line from (501, 126) to (379, 164) then Creates a yellow circular shape at (390, 62) with radius 45.
; PLAN: r0=457(x), r1=102(y), r2=20(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=501(x1), r6=126(y1), r7=379(x2), r8=164(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=62(y), r12=45(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 457
LDI r1, 102
LDI r2, 20
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 126
LDI r7, 379
LDI r8, 164
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 62
LDI r12, 45
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
