; DESCRIPTION: Renders a black disk with center (163, 148) and radius 72.
; PLAN: r0=163(x), r1=148(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 148
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
