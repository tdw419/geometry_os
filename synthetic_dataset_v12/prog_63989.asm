; DESCRIPTION: Places a orange circle of radius 22 at center (41, 83).
; PLAN: r0=41(x), r1=83(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 83
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
