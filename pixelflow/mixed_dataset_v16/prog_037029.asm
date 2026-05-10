; DESCRIPTION: Creates a orange circular shape at (380, 69) with radius 68.
; PLAN: r0=380(x), r1=69(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 69
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
