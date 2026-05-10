; DESCRIPTION: Creates a black circular shape at (269, 169) with radius 61.
; PLAN: r0=269(x), r1=169(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 169
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
