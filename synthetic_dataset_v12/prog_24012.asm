; DESCRIPTION: Creates a white circular shape at (447, 140) with radius 45.
; PLAN: r0=447(x), r1=140(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 140
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
