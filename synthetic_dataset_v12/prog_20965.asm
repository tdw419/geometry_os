; DESCRIPTION: Renders a black disk with center (432, 128) and radius 29.
; PLAN: r0=432(x), r1=128(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 128
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
