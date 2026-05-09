; DESCRIPTION: Renders a black disk with center (376, 128) and radius 62.
; PLAN: r0=376(x), r1=128(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 128
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
