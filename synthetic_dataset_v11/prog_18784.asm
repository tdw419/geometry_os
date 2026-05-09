; DESCRIPTION: Creates a green circular shape at (190, 69) with radius 66.
; PLAN: r0=190(x), r1=69(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 69
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
