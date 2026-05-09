; DESCRIPTION: Creates a orange circular shape at (217, 104) with radius 53.
; PLAN: r0=217(x), r1=104(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 104
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
