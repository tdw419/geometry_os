; DESCRIPTION: Creates a yellow circular shape at (167, 97) with radius 69.
; PLAN: r0=167(x), r1=97(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 97
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
