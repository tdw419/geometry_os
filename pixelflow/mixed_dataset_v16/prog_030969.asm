; DESCRIPTION: Places a orange disk with center (194, 3) and radius 41.
; PLAN: r0=194(x), r1=3(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 3
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
