; DESCRIPTION: Creates a black circular shape at (271, 172) with radius 22.
; PLAN: r0=271(x), r1=172(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 172
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
