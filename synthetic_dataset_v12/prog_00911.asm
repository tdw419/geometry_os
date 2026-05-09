; DESCRIPTION: Places a orange circle of radius 41 at center (296, 81).
; PLAN: r0=296(x), r1=81(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 81
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
