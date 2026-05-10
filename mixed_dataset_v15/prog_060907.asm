; DESCRIPTION: Renders a black disk with center (71, 126) and radius 33.
; PLAN: r0=71(x), r1=126(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 126
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
