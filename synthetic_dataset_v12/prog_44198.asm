; DESCRIPTION: Composite: Places a orange dot at position (351, 64) then Draws a white line from (251, 237) to (171, 4) then Creates a purple circular shape at (359, 26) with radius 14.
; PLAN: r0=351(x), r1=64(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=251(x1), r6=237(y1), r7=171(x2), r8=4(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=359(x), r11=26(y), r12=14(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 351
LDI r1, 64
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 251
LDI r6, 237
LDI r7, 171
LDI r8, 4
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 26
LDI r12, 14
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
