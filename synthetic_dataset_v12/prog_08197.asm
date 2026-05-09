; DESCRIPTION: Renders a purple disk with center (148, 100) and radius 20.
; PLAN: r0=148(x), r1=100(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 100
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
