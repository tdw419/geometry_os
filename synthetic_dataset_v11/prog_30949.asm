; DESCRIPTION: Renders a black disk with center (68, 112) and radius 52.
; PLAN: r0=68(x), r1=112(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 112
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
