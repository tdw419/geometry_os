; DESCRIPTION: Composite: Draws a orange line from (322, 16) to (215, 136) then Sets a single red pixel at (318, 41).
; PLAN: r0=322(x1), r1=16(y1), r2=215(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=41(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 322
LDI r1, 16
LDI r2, 215
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 41
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
