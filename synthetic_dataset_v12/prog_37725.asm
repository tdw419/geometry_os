; DESCRIPTION: Creates a white circular shape at (366, 122) with radius 73.
; PLAN: r0=366(x), r1=122(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 122
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
