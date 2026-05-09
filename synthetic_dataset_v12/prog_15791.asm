; DESCRIPTION: Renders a purple disk with center (204, 57) and radius 19.
; PLAN: r0=204(x), r1=57(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 57
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
