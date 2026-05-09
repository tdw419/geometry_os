; DESCRIPTION: Renders a black disk with center (182, 139) and radius 69.
; PLAN: r0=182(x), r1=139(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 139
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
