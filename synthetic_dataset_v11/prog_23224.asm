; DESCRIPTION: Renders a black disk with center (192, 101) and radius 21.
; PLAN: r0=192(x), r1=101(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 101
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
