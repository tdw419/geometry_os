; DESCRIPTION: Creates a black circular shape at (113, 145) with radius 44.
; PLAN: r0=113(x), r1=145(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 145
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
