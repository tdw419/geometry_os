; DESCRIPTION: Creates a orange circular shape at (217, 46) with radius 32.
; PLAN: r0=217(x), r1=46(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 46
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
