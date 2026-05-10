; DESCRIPTION: Creates a orange circular shape at (254, 118) with radius 51.
; PLAN: r0=254(x), r1=118(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 118
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
