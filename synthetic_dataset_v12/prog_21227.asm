; DESCRIPTION: Creates a orange circular shape at (84, 172) with radius 68.
; PLAN: r0=84(x), r1=172(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 172
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
