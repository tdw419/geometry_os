; DESCRIPTION: Renders a purple disk with center (358, 158) and radius 80.
; PLAN: r0=358(x), r1=158(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 158
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
