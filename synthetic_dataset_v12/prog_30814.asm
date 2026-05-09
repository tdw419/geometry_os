; DESCRIPTION: Renders a blue disk with center (497, 158) and radius 14.
; PLAN: r0=497(x), r1=158(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 497
LDI r1, 158
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
