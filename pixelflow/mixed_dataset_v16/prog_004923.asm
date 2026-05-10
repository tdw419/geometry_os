; DESCRIPTION: Creates a orange circular shape at (151, 89) with radius 73.
; PLAN: r0=151(x), r1=89(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 89
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
