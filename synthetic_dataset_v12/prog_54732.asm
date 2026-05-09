; DESCRIPTION: Creates a orange circular shape at (151, 199) with radius 50.
; PLAN: r0=151(x), r1=199(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 199
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
