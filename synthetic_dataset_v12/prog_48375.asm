; DESCRIPTION: Creates a orange circular shape at (98, 141) with radius 29.
; PLAN: r0=98(x), r1=141(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 141
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
