; DESCRIPTION: Places a orange circle of radius 28 at center (54, 41).
; PLAN: r0=54(x), r1=41(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 41
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
