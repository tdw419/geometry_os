; DESCRIPTION: Creates a orange circular shape at (303, 157) with radius 47.
; PLAN: r0=303(x), r1=157(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 157
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
