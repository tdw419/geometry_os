; DESCRIPTION: Renders a purple disk with center (407, 140) and radius 45.
; PLAN: r0=407(x), r1=140(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 140
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
