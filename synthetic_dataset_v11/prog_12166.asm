; DESCRIPTION: Creates a blue circular shape at (128, 122) with radius 30.
; PLAN: r0=128(x), r1=122(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 122
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
