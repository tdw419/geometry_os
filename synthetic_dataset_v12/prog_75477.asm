; DESCRIPTION: Composite: Renders a black disk with center (72, 51) and radius 47 then Draws a orange line from (358, 224) to (430, 109) then Sets a single blue pixel at (408, 95).
; PLAN: r0=72(x), r1=51(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x1), r6=224(y1), r7=430(x2), r8=109(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=408(x), r11=95(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 72
LDI r1, 51
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 224
LDI r7, 430
LDI r8, 109
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 95
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
