; DESCRIPTION: Places a blue circle of radius 40 at center (163, 82).
; PLAN: r0=163(x), r1=82(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 82
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
