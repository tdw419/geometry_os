; DESCRIPTION: Composite: Creates a black circular shape at (417, 89) with radius 49 then Sets a single magenta pixel at (47, 67).
; PLAN: r0=417(x), r1=89(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=67(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 417
LDI r1, 89
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 67
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
