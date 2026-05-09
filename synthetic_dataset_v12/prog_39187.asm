; DESCRIPTION: Creates a orange circular shape at (338, 141) with radius 54.
; PLAN: r0=338(x), r1=141(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 141
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
