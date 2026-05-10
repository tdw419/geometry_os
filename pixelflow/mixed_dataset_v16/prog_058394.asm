; DESCRIPTION: Creates a orange circular shape at (424, 115) with radius 63.
; PLAN: r0=424(x), r1=115(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 115
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
