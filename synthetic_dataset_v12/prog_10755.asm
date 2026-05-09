; DESCRIPTION: Creates a black circular shape at (248, 132) with radius 66.
; PLAN: r0=248(x), r1=132(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 132
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
