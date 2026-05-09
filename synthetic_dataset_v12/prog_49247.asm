; DESCRIPTION: Creates a orange circular shape at (207, 99) with radius 69.
; PLAN: r0=207(x), r1=99(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 99
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
