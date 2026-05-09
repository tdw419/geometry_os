; DESCRIPTION: Creates a orange circular shape at (46, 145) with radius 11.
; PLAN: r0=46(x), r1=145(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 145
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
