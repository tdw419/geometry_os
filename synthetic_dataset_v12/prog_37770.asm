; DESCRIPTION: Renders a purple disk with center (314, 145) and radius 33.
; PLAN: r0=314(x), r1=145(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 145
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
