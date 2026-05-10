; DESCRIPTION: Renders a orange circular shape at (167, 31) with radius 14.
; PLAN: r0=167(x), r1=31(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 31
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
