; DESCRIPTION: Places a green circle of radius 73 at center (163, 76).
; PLAN: r0=163(x), r1=76(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 76
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
