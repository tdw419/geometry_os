; DESCRIPTION: Places a white circle of radius 15 at center (398, 41).
; PLAN: r0=398(x), r1=41(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 41
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
