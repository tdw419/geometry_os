; DESCRIPTION: Renders a black disk with center (223, 163) and radius 15.
; PLAN: r0=223(x), r1=163(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 163
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
