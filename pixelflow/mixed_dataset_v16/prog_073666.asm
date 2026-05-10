; DESCRIPTION: Places a orange circle of radius 75 at center (268, 81).
; PLAN: r0=268(x), r1=81(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 81
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
