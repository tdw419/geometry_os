; DESCRIPTION: Creates a orange circular shape at (137, 131) with radius 74.
; PLAN: r0=137(x), r1=131(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 131
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
