; DESCRIPTION: Renders a black disk with center (407, 202) and radius 43.
; PLAN: r0=407(x), r1=202(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 202
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
