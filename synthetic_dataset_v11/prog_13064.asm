; DESCRIPTION: Places a white circle of radius 41 at center (105, 116).
; PLAN: r0=105(x), r1=116(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 116
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
