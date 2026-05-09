; DESCRIPTION: Creates a orange circular shape at (138, 133) with radius 11.
; PLAN: r0=138(x), r1=133(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 133
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
