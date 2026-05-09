; DESCRIPTION: Creates a orange circular shape at (129, 141) with radius 79.
; PLAN: r0=129(x), r1=141(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 141
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
