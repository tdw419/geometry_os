; DESCRIPTION: Renders a black disk with center (130, 85) and radius 63.
; PLAN: r0=130(x), r1=85(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 85
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
