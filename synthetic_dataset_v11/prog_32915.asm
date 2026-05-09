; DESCRIPTION: Creates a red circular shape at (123, 110) with radius 31.
; PLAN: r0=123(x), r1=110(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 110
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
