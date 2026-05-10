; DESCRIPTION: Renders a black disk with center (408, 88) and radius 71.
; PLAN: r0=408(x), r1=88(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 88
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
