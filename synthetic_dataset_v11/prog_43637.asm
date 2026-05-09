; DESCRIPTION: Renders a black disk with center (76, 80) and radius 64.
; PLAN: r0=76(x), r1=80(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 80
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
