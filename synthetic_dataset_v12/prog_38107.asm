; DESCRIPTION: Creates a blue circular shape at (207, 139) with radius 80.
; PLAN: r0=207(x), r1=139(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 139
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
