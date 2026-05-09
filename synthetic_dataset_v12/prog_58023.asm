; DESCRIPTION: Places a orange circle of radius 41 at center (58, 138).
; PLAN: r0=58(x), r1=138(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 138
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
