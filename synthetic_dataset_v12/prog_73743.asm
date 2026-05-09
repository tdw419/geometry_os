; DESCRIPTION: Creates a orange circular shape at (402, 179) with radius 28.
; PLAN: r0=402(x), r1=179(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 179
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
