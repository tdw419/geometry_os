; DESCRIPTION: Creates a black circular shape at (440, 97) with radius 29.
; PLAN: r0=440(x), r1=97(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 97
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
