; DESCRIPTION: Renders a blue disk with center (71, 76) and radius 15.
; PLAN: r0=71(x), r1=76(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 76
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
