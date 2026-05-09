; DESCRIPTION: Places a white circle of radius 18 at center (348, 161).
; PLAN: r0=348(x), r1=161(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 161
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
