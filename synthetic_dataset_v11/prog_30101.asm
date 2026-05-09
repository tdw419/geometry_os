; DESCRIPTION: Creates a black circular shape at (78, 124) with radius 73.
; PLAN: r0=78(x), r1=124(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 124
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
