; DESCRIPTION: Renders a purple disk with center (133, 39) and radius 20.
; PLAN: r0=133(x), r1=39(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 39
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
