; DESCRIPTION: Creates a black circular shape at (177, 152) with radius 60.
; PLAN: r0=177(x), r1=152(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 152
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
