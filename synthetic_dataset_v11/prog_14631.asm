; DESCRIPTION: Renders a black disk with center (122, 86) and radius 17.
; PLAN: r0=122(x), r1=86(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 86
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
