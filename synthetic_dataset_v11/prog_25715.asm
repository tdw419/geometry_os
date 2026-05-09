; DESCRIPTION: Renders a purple disk with center (110, 140) and radius 78.
; PLAN: r0=110(x), r1=140(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 140
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
