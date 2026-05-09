; DESCRIPTION: Creates a orange circular shape at (133, 106) with radius 51.
; PLAN: r0=133(x), r1=106(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 106
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
