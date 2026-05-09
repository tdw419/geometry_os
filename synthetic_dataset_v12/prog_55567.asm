; DESCRIPTION: Renders a black disk with center (141, 138) and radius 37.
; PLAN: r0=141(x), r1=138(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 138
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
