; DESCRIPTION: Places a white circle of radius 66 at center (163, 73).
; PLAN: r0=163(x), r1=73(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 73
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
