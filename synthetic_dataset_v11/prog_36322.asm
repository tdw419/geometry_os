; DESCRIPTION: Creates a orange circular shape at (84, 87) with radius 67.
; PLAN: r0=84(x), r1=87(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 87
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
