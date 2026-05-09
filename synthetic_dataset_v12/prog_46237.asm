; DESCRIPTION: Creates a blue circular shape at (127, 123) with radius 14.
; PLAN: r0=127(x), r1=123(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 123
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
