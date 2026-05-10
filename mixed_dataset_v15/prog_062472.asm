; DESCRIPTION: Renders a purple disk with center (159, 95) and radius 75.
; PLAN: r0=159(x), r1=95(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 95
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
