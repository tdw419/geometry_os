; DESCRIPTION: Creates a orange circular shape at (170, 172) with radius 80.
; PLAN: r0=170(x), r1=172(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 172
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
