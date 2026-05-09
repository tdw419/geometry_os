; DESCRIPTION: Creates a blue circular shape at (178, 139) with radius 72.
; PLAN: r0=178(x), r1=139(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 139
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
