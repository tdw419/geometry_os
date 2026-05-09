; DESCRIPTION: Creates a orange circular shape at (117, 151) with radius 12.
; PLAN: r0=117(x), r1=151(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 151
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
