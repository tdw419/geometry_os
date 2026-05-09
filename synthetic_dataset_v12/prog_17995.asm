; DESCRIPTION: Creates a white circular shape at (247, 160) with radius 69.
; PLAN: r0=247(x), r1=160(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 160
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
