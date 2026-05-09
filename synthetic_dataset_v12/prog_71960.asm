; DESCRIPTION: Creates a orange circular shape at (59, 103) with radius 30.
; PLAN: r0=59(x), r1=103(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 103
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
