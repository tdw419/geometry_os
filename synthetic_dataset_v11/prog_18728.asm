; DESCRIPTION: Creates a black circular shape at (77, 163) with radius 19.
; PLAN: r0=77(x), r1=163(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 163
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
