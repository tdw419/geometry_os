; DESCRIPTION: Renders a purple disk with center (78, 85) and radius 33.
; PLAN: r0=78(x), r1=85(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 85
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
