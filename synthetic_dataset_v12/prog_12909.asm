; DESCRIPTION: Renders a black disk with center (157, 80) and radius 80.
; PLAN: r0=157(x), r1=80(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 80
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
