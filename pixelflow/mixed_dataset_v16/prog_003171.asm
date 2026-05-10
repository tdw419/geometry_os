; DESCRIPTION: Renders a purple disk with center (388, 155) and radius 52.
; PLAN: r0=388(x), r1=155(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 155
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
