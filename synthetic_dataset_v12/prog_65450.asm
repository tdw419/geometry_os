; DESCRIPTION: Creates a white circular shape at (99, 162) with radius 65.
; PLAN: r0=99(x), r1=162(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 162
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
