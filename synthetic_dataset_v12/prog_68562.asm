; DESCRIPTION: Composite: Draws a black circle centered at (209, 131) with radius 62 then Sets a single purple pixel at (263, 119).
; PLAN: r0=209(x), r1=131(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=119(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 131
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 119
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
