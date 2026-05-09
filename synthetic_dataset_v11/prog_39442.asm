; DESCRIPTION: Creates a black circular shape at (177, 41) with radius 14.
; PLAN: r0=177(x), r1=41(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 41
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
