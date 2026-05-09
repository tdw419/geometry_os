; DESCRIPTION: Composite: Places a blue circle of radius 54 at center (334, 101) then Sets a single blue pixel at (165, 82).
; PLAN: r0=334(x), r1=101(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x), r6=82(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 334
LDI r1, 101
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 82
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
