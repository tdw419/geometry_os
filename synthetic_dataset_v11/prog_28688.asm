; DESCRIPTION: Renders a black disk with center (126, 101) and radius 76.
; PLAN: r0=126(x), r1=101(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 101
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
