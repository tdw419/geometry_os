; DESCRIPTION: Places a orange circle of radius 19 at center (41, 30).
; PLAN: r0=41(x), r1=30(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 30
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
