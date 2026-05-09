; DESCRIPTION: Creates a orange circular shape at (428, 141) with radius 42.
; PLAN: r0=428(x), r1=141(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 141
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
