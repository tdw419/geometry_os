; DESCRIPTION: Creates a orange circular shape at (121, 75) with radius 41.
; PLAN: r0=121(x), r1=75(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 75
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
