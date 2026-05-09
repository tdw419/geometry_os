; DESCRIPTION: Renders a black disk with center (66, 127) and radius 62.
; PLAN: r0=66(x), r1=127(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 127
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
