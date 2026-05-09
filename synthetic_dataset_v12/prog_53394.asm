; DESCRIPTION: Composite: Renders a red line between points (238, 81) and (325, 185) then Sets a single red pixel at (161, 233).
; PLAN: r0=238(x1), r1=81(y1), r2=325(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=233(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 238
LDI r1, 81
LDI r2, 325
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 233
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
