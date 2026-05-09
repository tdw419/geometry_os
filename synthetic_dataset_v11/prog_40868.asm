; DESCRIPTION: Creates a blue circular shape at (200, 101) with radius 50.
; PLAN: r0=200(x), r1=101(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 101
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
