; DESCRIPTION: Renders a black disk with center (456, 225) and radius 24.
; PLAN: r0=456(x), r1=225(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 225
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
