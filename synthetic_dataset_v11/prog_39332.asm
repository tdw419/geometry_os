; DESCRIPTION: Renders a black disk with center (76, 62) and radius 58.
; PLAN: r0=76(x), r1=62(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 62
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
