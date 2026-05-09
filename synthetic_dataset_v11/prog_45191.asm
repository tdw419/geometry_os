; DESCRIPTION: Creates a blue circular shape at (84, 65) with radius 13.
; PLAN: r0=84(x), r1=65(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 65
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
