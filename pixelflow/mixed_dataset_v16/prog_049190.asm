; DESCRIPTION: Renders a black disk with center (100, 60) and radius 51.
; PLAN: r0=100(x), r1=60(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 60
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
