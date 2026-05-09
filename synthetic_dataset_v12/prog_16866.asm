; DESCRIPTION: Composite: Draws a green line from (11, 15) to (495, 82) then Sets a single green pixel at (491, 93) then Creates a yellow circular shape at (298, 89) with radius 75.
; PLAN: r0=11(x1), r1=15(y1), r2=495(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=491(x), r6=93(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=298(x), r11=89(y), r12=75(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 11
LDI r1, 15
LDI r2, 495
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 93
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 298
LDI r11, 89
LDI r12, 75
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
