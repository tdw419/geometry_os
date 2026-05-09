; DESCRIPTION: Renders a black disk with center (118, 100) and radius 28.
; PLAN: r0=118(x), r1=100(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 100
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
