; DESCRIPTION: Creates a black circular shape at (90, 132) with radius 73.
; PLAN: r0=90(x), r1=132(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 132
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
