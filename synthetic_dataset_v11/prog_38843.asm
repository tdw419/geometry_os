; DESCRIPTION: Creates a green circular shape at (80, 91) with radius 69.
; PLAN: r0=80(x), r1=91(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 91
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
