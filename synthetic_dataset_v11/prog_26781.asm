; DESCRIPTION: Creates a black circular shape at (143, 132) with radius 47.
; PLAN: r0=143(x), r1=132(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 132
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
