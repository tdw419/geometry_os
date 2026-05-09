; DESCRIPTION: Creates a white circular shape at (259, 65) with radius 65.
; PLAN: r0=259(x), r1=65(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 65
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
