; DESCRIPTION: Creates a orange circular shape at (33, 205) with radius 11.
; PLAN: r0=33(x), r1=205(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 205
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
