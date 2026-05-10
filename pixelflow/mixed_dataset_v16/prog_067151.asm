; DESCRIPTION: Creates a blue circular shape at (144, 175) with radius 47.
; PLAN: r0=144(x), r1=175(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 175
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
