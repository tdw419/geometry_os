; DESCRIPTION: Renders a black disk with center (271, 139) and radius 53.
; PLAN: r0=271(x), r1=139(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 139
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
