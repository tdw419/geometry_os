; DESCRIPTION: Composite: Draws a purple circle centered at (118, 145) with radius 45 then Sets a single yellow pixel at (476, 205).
; PLAN: r0=118(x), r1=145(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x), r6=205(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 118
LDI r1, 145
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 205
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
