; DESCRIPTION: Renders a black disk with center (32, 36) and radius 15.
; PLAN: r0=32(x), r1=36(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 36
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
