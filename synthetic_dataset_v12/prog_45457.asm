; DESCRIPTION: Draws a black circle centered at (257, 119) with radius 31.
; PLAN: r0=257(x), r1=119(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 119
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
