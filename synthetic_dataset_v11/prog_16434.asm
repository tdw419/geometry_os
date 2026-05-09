; DESCRIPTION: Creates a orange circular shape at (111, 80) with radius 53.
; PLAN: r0=111(x), r1=80(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 80
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
