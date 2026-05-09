; DESCRIPTION: Renders a purple disk with center (119, 109) and radius 44.
; PLAN: r0=119(x), r1=109(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 109
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
