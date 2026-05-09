; DESCRIPTION: Creates a white circular shape at (215, 156) with radius 69.
; PLAN: r0=215(x), r1=156(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 156
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
