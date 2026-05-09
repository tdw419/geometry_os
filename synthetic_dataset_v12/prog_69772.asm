; DESCRIPTION: Creates a black circular shape at (349, 169) with radius 72.
; PLAN: r0=349(x), r1=169(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 169
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
