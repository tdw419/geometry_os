; DESCRIPTION: Renders a blue disk with center (83, 170) and radius 76.
; PLAN: r0=83(x), r1=170(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 170
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
