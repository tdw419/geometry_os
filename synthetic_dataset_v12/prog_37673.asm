; DESCRIPTION: Places a black circle of radius 62 at center (155, 83).
; PLAN: r0=155(x), r1=83(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 83
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
