; DESCRIPTION: Composite: Draws a purple circle centered at (97, 64) with radius 49 then Sets a single purple pixel at (234, 139).
; PLAN: r0=97(x), r1=64(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=139(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 97
LDI r1, 64
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 139
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
