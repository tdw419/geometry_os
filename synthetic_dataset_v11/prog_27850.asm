; DESCRIPTION: Creates a blue circular shape at (78, 65) with radius 32.
; PLAN: r0=78(x), r1=65(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 65
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
