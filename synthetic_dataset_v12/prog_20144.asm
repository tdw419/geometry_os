; DESCRIPTION: Creates a black circular shape at (122, 160) with radius 41.
; PLAN: r0=122(x), r1=160(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 160
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
