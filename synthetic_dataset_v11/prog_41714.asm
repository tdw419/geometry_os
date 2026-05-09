; DESCRIPTION: Creates a orange circular shape at (84, 176) with radius 43.
; PLAN: r0=84(x), r1=176(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 176
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
