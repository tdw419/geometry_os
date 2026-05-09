; DESCRIPTION: Creates a orange circular shape at (81, 152) with radius 31.
; PLAN: r0=81(x), r1=152(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 152
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
