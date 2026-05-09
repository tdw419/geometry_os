; DESCRIPTION: Creates a orange circular shape at (79, 188) with radius 43.
; PLAN: r0=79(x), r1=188(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 188
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
