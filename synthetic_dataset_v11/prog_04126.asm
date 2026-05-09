; DESCRIPTION: Places a white circle of radius 54 at center (163, 149).
; PLAN: r0=163(x), r1=149(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 149
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
