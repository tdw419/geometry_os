; DESCRIPTION: Renders a black disk with center (88, 45) and radius 14.
; PLAN: r0=88(x), r1=45(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 45
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
