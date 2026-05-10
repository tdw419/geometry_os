; DESCRIPTION: Creates a orange circular shape at (101, 167) with radius 65.
; PLAN: r0=101(x), r1=167(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 167
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
