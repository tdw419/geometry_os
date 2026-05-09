; DESCRIPTION: Creates a red circular shape at (101, 41) with radius 38.
; PLAN: r0=101(x), r1=41(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 41
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
