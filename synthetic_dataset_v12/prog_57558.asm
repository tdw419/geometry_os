; DESCRIPTION: Creates a orange circular shape at (106, 93) with radius 25.
; PLAN: r0=106(x), r1=93(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 93
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
