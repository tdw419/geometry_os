; DESCRIPTION: Creates a orange circular shape at (163, 200) with radius 42.
; PLAN: r0=163(x), r1=200(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 200
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
