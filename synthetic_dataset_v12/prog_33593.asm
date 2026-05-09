; DESCRIPTION: Renders a purple disk with center (55, 188) and radius 45.
; PLAN: r0=55(x), r1=188(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 188
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
