; DESCRIPTION: Creates a red circular shape at (41, 217) with radius 35.
; PLAN: r0=41(x), r1=217(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 217
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
