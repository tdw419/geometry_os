; DESCRIPTION: Creates a black circular shape at (94, 194) with radius 40.
; PLAN: r0=94(x), r1=194(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 194
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
