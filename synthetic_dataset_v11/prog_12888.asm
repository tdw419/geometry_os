; DESCRIPTION: Renders a purple disk with center (141, 22) and radius 11.
; PLAN: r0=141(x), r1=22(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 22
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
