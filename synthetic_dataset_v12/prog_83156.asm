; DESCRIPTION: Renders a black disk with center (175, 141) and radius 76.
; PLAN: r0=175(x), r1=141(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 141
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
