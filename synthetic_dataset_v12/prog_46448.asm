; DESCRIPTION: Creates a orange circular shape at (185, 110) with radius 57.
; PLAN: r0=185(x), r1=110(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 110
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
