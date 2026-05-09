; DESCRIPTION: Renders a purple disk with center (220, 115) and radius 78.
; PLAN: r0=220(x), r1=115(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 115
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
