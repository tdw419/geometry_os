; DESCRIPTION: Renders a black disk with center (156, 134) and radius 69.
; PLAN: r0=156(x), r1=134(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 134
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
