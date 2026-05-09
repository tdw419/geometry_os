; DESCRIPTION: Renders a blue disk with center (427, 157) and radius 53.
; PLAN: r0=427(x), r1=157(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 157
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
