; DESCRIPTION: Creates a blue circular shape at (89, 99) with radius 67.
; PLAN: r0=89(x), r1=99(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 99
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
