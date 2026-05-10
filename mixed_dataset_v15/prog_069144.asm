; DESCRIPTION: Creates a green circular shape at (72, 70) with radius 69.
; PLAN: r0=72(x), r1=70(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 70
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
