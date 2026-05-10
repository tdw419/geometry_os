; DESCRIPTION: Renders a blue disk with center (158, 199) and radius 53.
; PLAN: r0=158(x), r1=199(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 199
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
