; DESCRIPTION: Creates a orange circular shape at (32, 45) with radius 32.
; PLAN: r0=32(x), r1=45(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 45
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
