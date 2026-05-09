; DESCRIPTION: Creates a black circular shape at (419, 167) with radius 11.
; PLAN: r0=419(x), r1=167(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 167
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
