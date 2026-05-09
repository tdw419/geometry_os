; DESCRIPTION: Creates a yellow circular shape at (104, 87) with radius 68.
; PLAN: r0=104(x), r1=87(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 87
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
