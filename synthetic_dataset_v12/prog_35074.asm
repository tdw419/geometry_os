; DESCRIPTION: Creates a yellow circular shape at (208, 167) with radius 69.
; PLAN: r0=208(x), r1=167(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 167
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
