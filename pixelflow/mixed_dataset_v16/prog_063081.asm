; DESCRIPTION: Composite: Draws a magenta line from (170, 60) to (427, 2) then Sets a single green pixel at (41, 76) then Draws a purple circle centered at (118, 163) with radius 77.
; PLAN: r0=170(x1), r1=60(y1), r2=427(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=41(x), r6=76(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=118(x), r11=163(y), r12=77(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 170
LDI r1, 60
LDI r2, 427
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 76
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 118
LDI r11, 163
LDI r12, 77
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
