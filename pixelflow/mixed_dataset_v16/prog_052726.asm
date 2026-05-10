; DESCRIPTION: Creates a black circular shape at (145, 57) with radius 32.
; PLAN: r0=145(x), r1=57(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 57
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
