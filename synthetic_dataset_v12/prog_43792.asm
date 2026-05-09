; DESCRIPTION: Renders a black disk with center (73, 156) and radius 58.
; PLAN: r0=73(x), r1=156(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 156
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
