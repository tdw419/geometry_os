; DESCRIPTION: Renders a blue disk with center (201, 171) and radius 43.
; PLAN: r0=201(x), r1=171(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 171
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
