; DESCRIPTION: Creates a orange circular shape at (47, 38) with radius 12.
; PLAN: r0=47(x), r1=38(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 38
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
