; DESCRIPTION: Creates a green circular shape at (366, 69) with radius 36.
; PLAN: r0=366(x), r1=69(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 69
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
