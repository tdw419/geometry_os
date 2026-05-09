; DESCRIPTION: Renders a purple disk with center (407, 65) and radius 53.
; PLAN: r0=407(x), r1=65(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 65
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
