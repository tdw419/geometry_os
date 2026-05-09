; DESCRIPTION: Renders a black disk with center (68, 148) and radius 37.
; PLAN: r0=68(x), r1=148(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 148
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
