; DESCRIPTION: Composite: Renders a magenta line between points (150, 139) and (87, 219) then Renders a orange box of size 16x24 starting at (122, 218) then Draws a purple circle centered at (432, 126) with radius 11.
; PLAN: r0=150(x1), r1=139(y1), r2=87(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=218(y), r7=16(width), r8=24(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=432(x), r11=126(y), r12=11(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 150
LDI r1, 139
LDI r2, 87
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 218
LDI r7, 16
LDI r8, 24
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 432
LDI r11, 126
LDI r12, 11
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
