; DESCRIPTION: Renders a purple disk with center (136, 159) and radius 54.
; PLAN: r0=136(x), r1=159(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 159
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
