; DESCRIPTION: Creates a orange circular shape at (135, 158) with radius 58.
; PLAN: r0=135(x), r1=158(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 158
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
