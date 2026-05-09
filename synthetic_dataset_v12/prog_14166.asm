; DESCRIPTION: Creates a yellow circular shape at (325, 69) with radius 68.
; PLAN: r0=325(x), r1=69(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 69
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
