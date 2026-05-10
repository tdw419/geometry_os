; DESCRIPTION: Creates a black circular shape at (411, 104) with radius 44.
; PLAN: r0=411(x), r1=104(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 104
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
