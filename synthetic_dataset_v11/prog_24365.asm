; DESCRIPTION: Creates a blue circular shape at (86, 103) with radius 43.
; PLAN: r0=86(x), r1=103(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 103
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
