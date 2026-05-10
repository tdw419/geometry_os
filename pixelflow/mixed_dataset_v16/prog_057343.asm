; DESCRIPTION: Renders a blue disk with center (129, 101) and radius 76.
; PLAN: r0=129(x), r1=101(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 101
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
