; DESCRIPTION: Creates a green circular shape at (116, 87) with radius 68.
; PLAN: r0=116(x), r1=87(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 87
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
