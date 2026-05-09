; DESCRIPTION: Renders a black disk with center (230, 86) and radius 53.
; PLAN: r0=230(x), r1=86(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 86
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
