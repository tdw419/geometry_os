; DESCRIPTION: Places a orange circle of radius 41 at center (129, 79).
; PLAN: r0=129(x), r1=79(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 79
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
