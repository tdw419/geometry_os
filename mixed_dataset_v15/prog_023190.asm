; DESCRIPTION: Creates a black circular shape at (278, 106) with radius 16.
; PLAN: r0=278(x), r1=106(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 106
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
