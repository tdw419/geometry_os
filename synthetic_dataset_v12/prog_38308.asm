; DESCRIPTION: Composite: Sets a single orange pixel at (505, 237) then Renders a black line between points (331, 128) and (379, 101) then Draws a green circle centered at (78, 105) with radius 16.
; PLAN: r0=505(x), r1=237(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=128(y1), r7=379(x2), r8=101(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=78(x), r11=105(y), r12=16(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 505
LDI r1, 237
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 331
LDI r6, 128
LDI r7, 379
LDI r8, 101
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 105
LDI r12, 16
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
