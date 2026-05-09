; DESCRIPTION: Creates a black circular shape at (135, 122) with radius 32.
; PLAN: r0=135(x), r1=122(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 122
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
