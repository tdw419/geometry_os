; DESCRIPTION: Creates a blue circular shape at (255, 66) with radius 62.
; PLAN: r0=255(x), r1=66(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 66
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
