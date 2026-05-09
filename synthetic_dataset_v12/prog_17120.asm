; DESCRIPTION: Renders a purple disk with center (100, 137) and radius 69.
; PLAN: r0=100(x), r1=137(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 137
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
