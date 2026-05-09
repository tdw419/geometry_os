; DESCRIPTION: Creates a black circular shape at (421, 76) with radius 66.
; PLAN: r0=421(x), r1=76(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 76
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
