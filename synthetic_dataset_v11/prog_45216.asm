; DESCRIPTION: Renders a black disk with center (139, 179) and radius 24.
; PLAN: r0=139(x), r1=179(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 179
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
