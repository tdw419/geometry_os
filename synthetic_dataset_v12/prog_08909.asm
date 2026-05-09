; DESCRIPTION: Renders a black disk with center (145, 183) and radius 52.
; PLAN: r0=145(x), r1=183(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 183
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
