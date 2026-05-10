; DESCRIPTION: Composite: Places a purple line segment connecting (254, 110) to (402, 159) then Draws a orange rectangle at (11, 102) with width 38 and height 111 then Sets a single green pixel at (179, 105).
; PLAN: r0=254(x1), r1=110(y1), r2=402(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=11(x), r6=102(y), r7=38(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=179(x), r11=105(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 254
LDI r1, 110
LDI r2, 402
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 102
LDI r7, 38
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 105
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
