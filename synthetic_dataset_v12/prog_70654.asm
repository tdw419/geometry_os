; DESCRIPTION: Creates a black circular shape at (209, 132) with radius 61.
; PLAN: r0=209(x), r1=132(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 132
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
