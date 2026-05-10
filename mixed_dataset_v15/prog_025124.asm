; DESCRIPTION: Creates a black circular shape at (459, 96) with radius 10.
; PLAN: r0=459(x), r1=96(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 96
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
