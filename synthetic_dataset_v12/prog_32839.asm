; DESCRIPTION: Creates a orange circular shape at (413, 103) with radius 69.
; PLAN: r0=413(x), r1=103(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 103
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
