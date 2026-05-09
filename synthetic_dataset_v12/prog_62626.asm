; DESCRIPTION: Creates a green circular shape at (114, 179) with radius 39.
; PLAN: r0=114(x), r1=179(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 179
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
