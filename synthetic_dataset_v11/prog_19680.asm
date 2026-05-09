; DESCRIPTION: Renders a purple disk with center (107, 155) and radius 21.
; PLAN: r0=107(x), r1=155(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 155
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
