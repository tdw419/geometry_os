; DESCRIPTION: Composite: Sets a single purple pixel at (483, 197) then Creates a blue circular shape at (312, 135) with radius 23.
; PLAN: r0=483(x), r1=197(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=135(y), r7=23(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 197
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 135
LDI r7, 23
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
