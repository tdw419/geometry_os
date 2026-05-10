; DESCRIPTION: Creates a orange circular shape at (260, 167) with radius 78.
; PLAN: r0=260(x), r1=167(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 167
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
