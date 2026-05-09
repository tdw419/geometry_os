; DESCRIPTION: Creates a black circular shape at (218, 106) with radius 56.
; PLAN: r0=218(x), r1=106(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 106
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
