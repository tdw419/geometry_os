; DESCRIPTION: Creates a orange circular shape at (113, 99) with radius 77.
; PLAN: r0=113(x), r1=99(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 99
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
