; DESCRIPTION: Creates a black circular shape at (140, 172) with radius 55.
; PLAN: r0=140(x), r1=172(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 172
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
