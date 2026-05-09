; DESCRIPTION: Creates a black circular shape at (382, 141) with radius 41.
; PLAN: r0=382(x), r1=141(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 141
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
