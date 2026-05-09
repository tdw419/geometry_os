; DESCRIPTION: Places a white circle of radius 78 at center (122, 157).
; PLAN: r0=122(x), r1=157(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 157
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
