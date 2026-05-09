; DESCRIPTION: Creates a blue circular shape at (371, 80) with radius 60.
; PLAN: r0=371(x), r1=80(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 80
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
