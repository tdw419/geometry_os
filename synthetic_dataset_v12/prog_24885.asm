; DESCRIPTION: Creates a green circular shape at (438, 79) with radius 69.
; PLAN: r0=438(x), r1=79(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 79
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
