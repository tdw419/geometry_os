; DESCRIPTION: Renders a black disk with center (409, 76) and radius 74.
; PLAN: r0=409(x), r1=76(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 76
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
