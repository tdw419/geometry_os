; DESCRIPTION: Creates a blue circular shape at (196, 68) with radius 37.
; PLAN: r0=196(x), r1=68(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 68
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
