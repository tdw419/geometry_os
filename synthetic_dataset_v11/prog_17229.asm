; DESCRIPTION: Renders a black disk with center (100, 171) and radius 36.
; PLAN: r0=100(x), r1=171(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 171
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
