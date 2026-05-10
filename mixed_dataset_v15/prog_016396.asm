; DESCRIPTION: Composite: Creates a purple rectangular region at (29, 176) spanning 52 by 62 pixels then Draws a orange line from (180, 157) to (220, 22) then Draws a magenta circle centered at (463, 199) with radius 32.
; PLAN: r0=29(x), r1=176(y), r2=52(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x1), r6=157(y1), r7=220(x2), r8=22(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=463(x), r11=199(y), r12=32(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 29
LDI r1, 176
LDI r2, 52
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 157
LDI r7, 220
LDI r8, 22
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 199
LDI r12, 32
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
