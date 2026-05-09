; DESCRIPTION: Renders a black disk with center (193, 123) and radius 24.
; PLAN: r0=193(x), r1=123(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 123
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
