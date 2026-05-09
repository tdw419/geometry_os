; DESCRIPTION: Creates a green circular shape at (74, 179) with radius 66.
; PLAN: r0=74(x), r1=179(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 179
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
