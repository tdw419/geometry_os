; DESCRIPTION: Creates a orange circular shape at (115, 205) with radius 25.
; PLAN: r0=115(x), r1=205(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 205
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
