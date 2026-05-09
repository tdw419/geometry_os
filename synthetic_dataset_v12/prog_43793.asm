; DESCRIPTION: Renders a purple disk with center (139, 125) and radius 74.
; PLAN: r0=139(x), r1=125(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 125
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
