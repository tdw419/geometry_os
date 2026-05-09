; DESCRIPTION: Places a orange circle of radius 41 at center (84, 210).
; PLAN: r0=84(x), r1=210(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 210
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
