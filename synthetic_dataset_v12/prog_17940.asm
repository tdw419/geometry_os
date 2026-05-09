; DESCRIPTION: Composite: Creates a black circular shape at (155, 232) with radius 19 then Sets a single blue pixel at (446, 153).
; PLAN: r0=155(x), r1=232(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=153(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 232
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 153
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
