; DESCRIPTION: Renders a purple disk with center (119, 117) and radius 66.
; PLAN: r0=119(x), r1=117(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 117
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
