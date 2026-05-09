; DESCRIPTION: Creates a orange circular shape at (182, 151) with radius 64.
; PLAN: r0=182(x), r1=151(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 151
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
