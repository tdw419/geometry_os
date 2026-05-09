; DESCRIPTION: Renders a black disk with center (47, 148) and radius 31.
; PLAN: r0=47(x), r1=148(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 148
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
