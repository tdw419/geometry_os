; DESCRIPTION: Creates a green circular shape at (164, 102) with radius 69.
; PLAN: r0=164(x), r1=102(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 102
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
