; DESCRIPTION: Creates a black circular shape at (257, 84) with radius 33.
; PLAN: r0=257(x), r1=84(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 84
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
