; DESCRIPTION: Creates a orange circular shape at (151, 116) with radius 35.
; PLAN: r0=151(x), r1=116(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 116
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
