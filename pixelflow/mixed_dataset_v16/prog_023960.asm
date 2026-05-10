; DESCRIPTION: Composite: Draws a purple line from (461, 2) to (310, 183) then Sets a single red pixel at (100, 192).
; PLAN: r0=461(x1), r1=2(y1), r2=310(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=192(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 461
LDI r1, 2
LDI r2, 310
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 192
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
