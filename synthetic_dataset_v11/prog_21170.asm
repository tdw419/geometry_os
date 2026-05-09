; DESCRIPTION: Creates a orange circular shape at (79, 25) with radius 23.
; PLAN: r0=79(x), r1=25(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 25
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
