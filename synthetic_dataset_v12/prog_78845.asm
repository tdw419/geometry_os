; DESCRIPTION: Creates a orange circular shape at (80, 131) with radius 41.
; PLAN: r0=80(x), r1=131(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 131
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
