; DESCRIPTION: Renders a purple disk with center (86, 78) and radius 76.
; PLAN: r0=86(x), r1=78(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 78
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
