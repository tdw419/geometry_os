; DESCRIPTION: Creates a orange circular shape at (70, 141) with radius 35.
; PLAN: r0=70(x), r1=141(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 141
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
