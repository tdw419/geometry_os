; DESCRIPTION: Creates a orange circular shape at (174, 117) with radius 26.
; PLAN: r0=174(x), r1=117(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 117
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
