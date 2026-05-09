; DESCRIPTION: Renders a black disk with center (85, 132) and radius 62.
; PLAN: r0=85(x), r1=132(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 132
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
