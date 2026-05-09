; DESCRIPTION: Creates a orange circular shape at (75, 40) with radius 38.
; PLAN: r0=75(x), r1=40(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 40
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
