; DESCRIPTION: Renders a purple disk with center (297, 100) and radius 35.
; PLAN: r0=297(x), r1=100(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 100
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
