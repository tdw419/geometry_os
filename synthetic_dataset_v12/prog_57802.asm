; DESCRIPTION: Creates a orange circular shape at (431, 177) with radius 62.
; PLAN: r0=431(x), r1=177(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 177
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
