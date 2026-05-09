; DESCRIPTION: Renders a black disk with center (223, 76) and radius 49.
; PLAN: r0=223(x), r1=76(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 76
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
