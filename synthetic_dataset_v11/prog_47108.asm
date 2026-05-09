; DESCRIPTION: Creates a orange circular shape at (109, 82) with radius 41.
; PLAN: r0=109(x), r1=82(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 82
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
