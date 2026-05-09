; DESCRIPTION: Renders a green disk with center (163, 80) and radius 79.
; PLAN: r0=163(x), r1=80(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 80
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
