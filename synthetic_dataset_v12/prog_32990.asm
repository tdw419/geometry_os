; DESCRIPTION: Creates a black circular shape at (471, 54) with radius 31.
; PLAN: r0=471(x), r1=54(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 54
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
