; DESCRIPTION: Renders a black disk with center (151, 123) and radius 21.
; PLAN: r0=151(x), r1=123(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 123
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
