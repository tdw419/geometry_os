; DESCRIPTION: Creates a black circular shape at (191, 156) with radius 41.
; PLAN: r0=191(x), r1=156(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 156
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
