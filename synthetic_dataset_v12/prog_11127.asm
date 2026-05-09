; DESCRIPTION: Renders a purple disk with center (318, 119) and radius 73.
; PLAN: r0=318(x), r1=119(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 119
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
