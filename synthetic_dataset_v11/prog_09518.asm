; DESCRIPTION: Creates a green circular shape at (117, 169) with radius 69.
; PLAN: r0=117(x), r1=169(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 169
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
