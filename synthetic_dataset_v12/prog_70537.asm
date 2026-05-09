; DESCRIPTION: Creates a orange circular shape at (261, 174) with radius 67.
; PLAN: r0=261(x), r1=174(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 174
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
