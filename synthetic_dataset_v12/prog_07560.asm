; DESCRIPTION: Renders a purple disk with center (266, 101) and radius 53.
; PLAN: r0=266(x), r1=101(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 101
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
