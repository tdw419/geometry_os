; DESCRIPTION: Creates a blue circular shape at (307, 192) with radius 53.
; PLAN: r0=307(x), r1=192(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 192
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
