; DESCRIPTION: Composite: Creates a purple circular shape at (357, 80) with radius 79 then Draws a black rectangle at (206, 31) with width 114 and height 94 then Sets a single orange pixel at (79, 235).
; PLAN: r0=357(x), r1=80(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=31(y), r7=114(width), r8=94(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=79(x), r11=235(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 357
LDI r1, 80
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 31
LDI r7, 114
LDI r8, 94
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 235
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
