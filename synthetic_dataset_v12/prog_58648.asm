; DESCRIPTION: Renders a black disk with center (63, 149) and radius 15.
; PLAN: r0=63(x), r1=149(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 149
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
