; DESCRIPTION: Renders a black disk with center (462, 77) and radius 43.
; PLAN: r0=462(x), r1=77(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 77
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
