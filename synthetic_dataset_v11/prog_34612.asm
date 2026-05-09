; DESCRIPTION: Renders a purple disk with center (124, 90) and radius 15.
; PLAN: r0=124(x), r1=90(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 90
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
