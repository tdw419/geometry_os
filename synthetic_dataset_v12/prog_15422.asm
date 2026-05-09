; DESCRIPTION: Renders a black disk with center (253, 55) and radius 36.
; PLAN: r0=253(x), r1=55(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 55
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
