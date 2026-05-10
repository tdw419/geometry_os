; DESCRIPTION: Renders a white disk with center (163, 119) and radius 63.
; PLAN: r0=163(x), r1=119(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 119
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
