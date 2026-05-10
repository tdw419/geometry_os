; DESCRIPTION: Renders a black disk with center (157, 73) and radius 70.
; PLAN: r0=157(x), r1=73(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 73
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
