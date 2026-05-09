; DESCRIPTION: Creates a orange circular shape at (195, 100) with radius 45.
; PLAN: r0=195(x), r1=100(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 100
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
