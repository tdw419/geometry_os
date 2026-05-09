; DESCRIPTION: Renders a black disk with center (81, 148) and radius 74.
; PLAN: r0=81(x), r1=148(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 148
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
