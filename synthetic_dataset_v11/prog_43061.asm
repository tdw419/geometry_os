; DESCRIPTION: Creates a orange circular shape at (110, 144) with radius 43.
; PLAN: r0=110(x), r1=144(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 144
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
