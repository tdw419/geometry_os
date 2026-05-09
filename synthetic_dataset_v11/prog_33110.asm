; DESCRIPTION: Creates a orange circular shape at (139, 126) with radius 64.
; PLAN: r0=139(x), r1=126(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 126
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
