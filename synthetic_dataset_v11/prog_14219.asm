; DESCRIPTION: Creates a black circular shape at (41, 49) with radius 34.
; PLAN: r0=41(x), r1=49(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 49
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
