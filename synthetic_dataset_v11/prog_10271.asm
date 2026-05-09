; DESCRIPTION: Places a white circle of radius 34 at center (78, 41).
; PLAN: r0=78(x), r1=41(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 41
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
