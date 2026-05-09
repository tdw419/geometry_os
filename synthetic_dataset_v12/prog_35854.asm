; DESCRIPTION: Creates a orange circular shape at (193, 61) with radius 11.
; PLAN: r0=193(x), r1=61(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 61
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
