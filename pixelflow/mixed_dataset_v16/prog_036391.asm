; DESCRIPTION: Creates a blue circular shape at (122, 128) with radius 54.
; PLAN: r0=122(x), r1=128(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 128
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
