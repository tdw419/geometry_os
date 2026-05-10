; DESCRIPTION: Creates a orange circular shape at (162, 113) with radius 54.
; PLAN: r0=162(x), r1=113(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 113
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
