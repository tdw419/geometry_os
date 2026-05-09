; DESCRIPTION: Renders a purple disk with center (216, 14) and radius 11.
; PLAN: r0=216(x), r1=14(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 14
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
