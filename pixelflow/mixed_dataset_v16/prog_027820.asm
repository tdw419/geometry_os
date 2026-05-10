; DESCRIPTION: Creates a blue circular shape at (388, 114) with radius 70.
; PLAN: r0=388(x), r1=114(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 114
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
