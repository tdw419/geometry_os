; DESCRIPTION: Creates a red circular shape at (41, 62) with radius 23.
; PLAN: r0=41(x), r1=62(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 62
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
