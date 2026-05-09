; DESCRIPTION: Renders a purple disk with center (409, 104) and radius 43.
; PLAN: r0=409(x), r1=104(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 104
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
