; DESCRIPTION: Creates a blue circular shape at (99, 144) with radius 53.
; PLAN: r0=99(x), r1=144(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 144
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
