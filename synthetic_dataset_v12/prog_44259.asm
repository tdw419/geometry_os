; DESCRIPTION: Creates a orange circular shape at (265, 69) with radius 41.
; PLAN: r0=265(x), r1=69(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 69
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
