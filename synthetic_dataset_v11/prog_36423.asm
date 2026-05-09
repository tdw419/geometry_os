; DESCRIPTION: Renders a black disk with center (126, 138) and radius 78.
; PLAN: r0=126(x), r1=138(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 138
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
