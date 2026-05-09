; DESCRIPTION: Places a white circle of radius 24 at center (84, 41).
; PLAN: r0=84(x), r1=41(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 41
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
