; DESCRIPTION: Composite: Places a purple circle of radius 27 at center (478, 36) then Sets a single black pixel at (484, 208).
; PLAN: r0=478(x), r1=36(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x), r6=208(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 478
LDI r1, 36
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 208
LDI r7, 0x000000
PSET r5, r6, r7
HALT
