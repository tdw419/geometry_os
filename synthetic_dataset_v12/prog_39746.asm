; DESCRIPTION: Creates a yellow circular shape at (417, 155) with radius 69.
; PLAN: r0=417(x), r1=155(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 155
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
