; DESCRIPTION: Places a white circle of radius 41 at center (145, 135).
; PLAN: r0=145(x), r1=135(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 135
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
