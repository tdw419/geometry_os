; DESCRIPTION: Places a white circle of radius 41 at center (316, 74).
; PLAN: r0=316(x), r1=74(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 74
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
