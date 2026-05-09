; DESCRIPTION: Creates a blue circular shape at (83, 139) with radius 59.
; PLAN: r0=83(x), r1=139(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 139
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
