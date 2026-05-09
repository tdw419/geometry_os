; DESCRIPTION: Creates a orange circular shape at (381, 198) with radius 57.
; PLAN: r0=381(x), r1=198(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 198
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
