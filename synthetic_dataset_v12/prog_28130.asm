; DESCRIPTION: Creates a black circular shape at (78, 94) with radius 74.
; PLAN: r0=78(x), r1=94(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 94
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
