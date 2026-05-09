; DESCRIPTION: Renders a black disk with center (181, 85) and radius 46.
; PLAN: r0=181(x), r1=85(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 85
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
