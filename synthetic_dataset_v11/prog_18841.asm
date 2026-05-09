; DESCRIPTION: Renders a black disk with center (184, 156) and radius 44.
; PLAN: r0=184(x), r1=156(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 156
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
