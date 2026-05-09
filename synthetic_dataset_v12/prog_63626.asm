; DESCRIPTION: Creates a orange circular shape at (328, 95) with radius 41.
; PLAN: r0=328(x), r1=95(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 95
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
