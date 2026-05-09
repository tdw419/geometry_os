; DESCRIPTION: Renders a purple disk with center (109, 198) and radius 20.
; PLAN: r0=109(x), r1=198(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 198
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
