; DESCRIPTION: Renders a black disk with center (337, 96) and radius 58.
; PLAN: r0=337(x), r1=96(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 96
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
