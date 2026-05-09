; DESCRIPTION: Renders a black disk with center (85, 86) and radius 50.
; PLAN: r0=85(x), r1=86(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 86
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
