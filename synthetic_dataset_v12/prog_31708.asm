; DESCRIPTION: Renders a blue disk with center (293, 119) and radius 78.
; PLAN: r0=293(x), r1=119(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 119
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
