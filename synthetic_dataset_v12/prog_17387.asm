; DESCRIPTION: Renders a black disk with center (253, 171) and radius 33.
; PLAN: r0=253(x), r1=171(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 171
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
