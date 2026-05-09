; DESCRIPTION: Creates a green circular shape at (438, 116) with radius 58.
; PLAN: r0=438(x), r1=116(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 116
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
