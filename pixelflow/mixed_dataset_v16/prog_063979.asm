; DESCRIPTION: Creates a blue circular shape at (312, 155) with radius 39.
; PLAN: r0=312(x), r1=155(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 155
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
