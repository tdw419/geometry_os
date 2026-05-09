; DESCRIPTION: Creates a orange circular shape at (54, 151) with radius 36.
; PLAN: r0=54(x), r1=151(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 151
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
