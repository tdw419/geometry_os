; DESCRIPTION: Composite: Creates a purple circular shape at (348, 177) with radius 23 then Sets a single purple pixel at (107, 168).
; PLAN: r0=348(x), r1=177(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=168(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 348
LDI r1, 177
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 168
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
