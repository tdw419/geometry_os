; DESCRIPTION: Creates a orange circular shape at (68, 142) with radius 65.
; PLAN: r0=68(x), r1=142(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 142
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
