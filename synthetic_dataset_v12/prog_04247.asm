; DESCRIPTION: Creates a white circular shape at (476, 145) with radius 10.
; PLAN: r0=476(x), r1=145(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 145
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
