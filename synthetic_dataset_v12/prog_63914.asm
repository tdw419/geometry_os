; DESCRIPTION: Creates a blue circular shape at (286, 123) with radius 13.
; PLAN: r0=286(x), r1=123(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 123
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
