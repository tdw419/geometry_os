; DESCRIPTION: Creates a blue circular shape at (287, 32) with radius 10.
; PLAN: r0=287(x), r1=32(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 32
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
