; DESCRIPTION: Creates a blue circular shape at (264, 139) with radius 74.
; PLAN: r0=264(x), r1=139(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 139
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
