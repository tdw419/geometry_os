; DESCRIPTION: Creates a black circular shape at (89, 42) with radius 41.
; PLAN: r0=89(x), r1=42(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 42
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
