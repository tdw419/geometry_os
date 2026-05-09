; DESCRIPTION: Renders a purple disk with center (78, 199) and radius 46.
; PLAN: r0=78(x), r1=199(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 199
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
