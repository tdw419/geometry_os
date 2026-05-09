; DESCRIPTION: Renders a black disk with center (96, 120) and radius 62.
; PLAN: r0=96(x), r1=120(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 120
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
