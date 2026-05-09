; DESCRIPTION: Renders a black disk with center (138, 122) and radius 38.
; PLAN: r0=138(x), r1=122(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 122
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
