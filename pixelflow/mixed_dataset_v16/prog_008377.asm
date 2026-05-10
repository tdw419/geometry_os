; DESCRIPTION: Creates a black circular shape at (353, 60) with radius 44.
; PLAN: r0=353(x), r1=60(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 60
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
