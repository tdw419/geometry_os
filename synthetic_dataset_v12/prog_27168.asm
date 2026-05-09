; DESCRIPTION: Renders a black disk with center (261, 114) and radius 55.
; PLAN: r0=261(x), r1=114(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 114
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
