; DESCRIPTION: Creates a blue circular shape at (142, 86) with radius 47.
; PLAN: r0=142(x), r1=86(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 86
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
