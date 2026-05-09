; DESCRIPTION: Renders a purple disk with center (264, 158) and radius 21.
; PLAN: r0=264(x), r1=158(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 158
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
