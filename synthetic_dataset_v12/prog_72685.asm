; DESCRIPTION: Places a white circle of radius 28 at center (41, 110).
; PLAN: r0=41(x), r1=110(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 110
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
