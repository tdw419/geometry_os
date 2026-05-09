; DESCRIPTION: Creates a orange circular shape at (93, 124) with radius 25.
; PLAN: r0=93(x), r1=124(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 124
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
