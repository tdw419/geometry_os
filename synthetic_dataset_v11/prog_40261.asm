; DESCRIPTION: Creates a black circular shape at (119, 112) with radius 77.
; PLAN: r0=119(x), r1=112(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 112
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
