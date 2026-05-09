; DESCRIPTION: Creates a orange circular shape at (193, 163) with radius 47.
; PLAN: r0=193(x), r1=163(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 163
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
