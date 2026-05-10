; DESCRIPTION: Composite: Renders a white line between points (348, 94) and (457, 189) then Places a white dot at position (87, 83) then Draws a black circle centered at (276, 118) with radius 72.
; PLAN: r0=348(x1), r1=94(y1), r2=457(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=83(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=276(x), r11=118(y), r12=72(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 348
LDI r1, 94
LDI r2, 457
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 83
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 276
LDI r11, 118
LDI r12, 72
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
