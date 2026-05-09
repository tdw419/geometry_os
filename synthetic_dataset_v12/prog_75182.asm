; DESCRIPTION: Composite: Renders a blue disk with center (218, 131) and radius 73 then Sets a single purple pixel at (491, 249).
; PLAN: r0=218(x), r1=131(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=491(x), r6=249(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 218
LDI r1, 131
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 491
LDI r6, 249
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
