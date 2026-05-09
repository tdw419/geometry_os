; DESCRIPTION: Creates a orange circular shape at (84, 212) with radius 10.
; PLAN: r0=84(x), r1=212(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 212
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
