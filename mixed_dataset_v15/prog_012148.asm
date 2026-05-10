; DESCRIPTION: Creates a black circular shape at (348, 155) with radius 49.
; PLAN: r0=348(x), r1=155(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 155
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
