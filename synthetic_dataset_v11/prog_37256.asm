; DESCRIPTION: Creates a orange circular shape at (185, 172) with radius 58.
; PLAN: r0=185(x), r1=172(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 172
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
