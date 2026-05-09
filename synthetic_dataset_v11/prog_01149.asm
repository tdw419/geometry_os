; DESCRIPTION: Creates a red circular shape at (110, 122) with radius 56.
; PLAN: r0=110(x), r1=122(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 122
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
