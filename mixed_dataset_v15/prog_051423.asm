; DESCRIPTION: Creates a orange circular shape at (393, 122) with radius 54.
; PLAN: r0=393(x), r1=122(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 122
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
