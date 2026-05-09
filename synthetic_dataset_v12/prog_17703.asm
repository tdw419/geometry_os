; DESCRIPTION: Places a orange circle of radius 41 at center (312, 193).
; PLAN: r0=312(x), r1=193(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 193
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
