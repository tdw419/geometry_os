; DESCRIPTION: Creates a yellow circular shape at (179, 81) with radius 28.
; PLAN: r0=179(x), r1=81(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 81
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
