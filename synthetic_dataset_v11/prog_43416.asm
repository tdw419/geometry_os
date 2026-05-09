; DESCRIPTION: Renders a purple disk with center (67, 85) and radius 51.
; PLAN: r0=67(x), r1=85(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 85
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
