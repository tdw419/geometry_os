; DESCRIPTION: Renders a black disk with center (194, 111) and radius 11.
; PLAN: r0=194(x), r1=111(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 111
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
