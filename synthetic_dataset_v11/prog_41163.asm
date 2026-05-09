; DESCRIPTION: Renders a black disk with center (157, 83) and radius 72.
; PLAN: r0=157(x), r1=83(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 83
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
