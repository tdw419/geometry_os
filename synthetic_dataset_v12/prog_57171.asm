; DESCRIPTION: Renders a black disk with center (238, 125) and radius 69.
; PLAN: r0=238(x), r1=125(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 125
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
