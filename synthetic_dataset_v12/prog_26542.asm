; DESCRIPTION: Creates a yellow circular shape at (232, 97) with radius 32.
; PLAN: r0=232(x), r1=97(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 97
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
