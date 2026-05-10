; DESCRIPTION: Creates a orange circular shape at (149, 124) with radius 45.
; PLAN: r0=149(x), r1=124(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 124
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
