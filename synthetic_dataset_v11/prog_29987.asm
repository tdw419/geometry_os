; DESCRIPTION: Creates a blue circular shape at (163, 99) with radius 32.
; PLAN: r0=163(x), r1=99(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 99
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
