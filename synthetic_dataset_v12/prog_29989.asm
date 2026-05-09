; DESCRIPTION: Creates a green circular shape at (190, 102) with radius 73.
; PLAN: r0=190(x), r1=102(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 102
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
