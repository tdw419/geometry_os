; DESCRIPTION: Creates a blue circular shape at (231, 64) with radius 30.
; PLAN: r0=231(x), r1=64(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 64
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
