; DESCRIPTION: Creates a orange circular shape at (93, 125) with radius 17.
; PLAN: r0=93(x), r1=125(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 125
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
