; DESCRIPTION: Creates a black circular shape at (419, 83) with radius 44.
; PLAN: r0=419(x), r1=83(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 83
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
