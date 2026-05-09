; DESCRIPTION: Renders a purple disk with center (419, 156) and radius 74.
; PLAN: r0=419(x), r1=156(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 156
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
