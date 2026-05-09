; DESCRIPTION: Places a white circle of radius 78 at center (119, 109).
; PLAN: r0=119(x), r1=109(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 109
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
