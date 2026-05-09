; DESCRIPTION: Creates a orange circular shape at (85, 121) with radius 79.
; PLAN: r0=85(x), r1=121(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 121
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
