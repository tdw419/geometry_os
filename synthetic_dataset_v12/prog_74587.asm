; DESCRIPTION: Renders a black disk with center (256, 137) and radius 69.
; PLAN: r0=256(x), r1=137(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 137
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
