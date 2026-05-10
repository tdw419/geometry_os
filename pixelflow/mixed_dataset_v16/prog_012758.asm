; DESCRIPTION: Renders a purple disk with center (286, 110) and radius 78.
; PLAN: r0=286(x), r1=110(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 110
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
