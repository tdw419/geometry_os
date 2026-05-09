; DESCRIPTION: Creates a blue circular shape at (476, 115) with radius 18.
; PLAN: r0=476(x), r1=115(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 115
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
