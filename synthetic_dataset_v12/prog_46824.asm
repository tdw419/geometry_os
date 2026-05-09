; DESCRIPTION: Renders a purple disk with center (409, 71) and radius 58.
; PLAN: r0=409(x), r1=71(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 71
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
