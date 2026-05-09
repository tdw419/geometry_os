; DESCRIPTION: Places a orange circle of radius 41 at center (303, 136).
; PLAN: r0=303(x), r1=136(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 136
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
