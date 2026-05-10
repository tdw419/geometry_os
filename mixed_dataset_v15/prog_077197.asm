; DESCRIPTION: Renders a black disk with center (163, 84) and radius 64.
; PLAN: r0=163(x), r1=84(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 84
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
