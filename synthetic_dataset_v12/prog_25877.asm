; DESCRIPTION: Composite: Draws a black circle centered at (191, 99) with radius 54 then Sets a single blue pixel at (134, 87).
; PLAN: r0=191(x), r1=99(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=87(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 191
LDI r1, 99
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 87
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
