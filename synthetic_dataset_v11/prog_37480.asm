; DESCRIPTION: Renders a blue disk with center (163, 157) and radius 54.
; PLAN: r0=163(x), r1=157(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 157
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
