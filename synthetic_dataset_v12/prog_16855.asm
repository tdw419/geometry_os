; DESCRIPTION: Renders a purple disk with center (142, 84) and radius 80.
; PLAN: r0=142(x), r1=84(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 84
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
