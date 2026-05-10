; DESCRIPTION: Renders a purple disk with center (159, 162) and radius 58.
; PLAN: r0=159(x), r1=162(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 162
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
