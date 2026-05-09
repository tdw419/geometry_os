; DESCRIPTION: Creates a orange circular shape at (314, 106) with radius 80.
; PLAN: r0=314(x), r1=106(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 106
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
