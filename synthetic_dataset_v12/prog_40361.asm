; DESCRIPTION: Renders a blue disk with center (273, 163) and radius 22.
; PLAN: r0=273(x), r1=163(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 163
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
