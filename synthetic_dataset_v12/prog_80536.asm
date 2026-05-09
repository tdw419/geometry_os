; DESCRIPTION: Creates a blue circular shape at (113, 123) with radius 60.
; PLAN: r0=113(x), r1=123(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 123
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
