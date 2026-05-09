; DESCRIPTION: Renders a black disk with center (64, 122) and radius 24.
; PLAN: r0=64(x), r1=122(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 122
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
