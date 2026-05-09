; DESCRIPTION: Creates a red circular shape at (111, 53) with radius 41.
; PLAN: r0=111(x), r1=53(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 53
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
