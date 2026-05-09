; DESCRIPTION: Draws a black circle centered at (435, 139) with radius 71.
; PLAN: r0=435(x), r1=139(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 139
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
