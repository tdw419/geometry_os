; DESCRIPTION: Renders a black disk with center (191, 102) and radius 24.
; PLAN: r0=191(x), r1=102(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 102
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
