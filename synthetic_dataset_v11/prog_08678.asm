; DESCRIPTION: Renders a purple disk with center (216, 192) and radius 20.
; PLAN: r0=216(x), r1=192(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 192
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
