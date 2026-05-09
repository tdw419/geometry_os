; DESCRIPTION: Composite: Draws a black line from (60, 14) to (71, 4) then Sets a single red pixel at (159, 108).
; PLAN: r0=60(x1), r1=14(y1), r2=71(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=108(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 60
LDI r1, 14
LDI r2, 71
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 108
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
