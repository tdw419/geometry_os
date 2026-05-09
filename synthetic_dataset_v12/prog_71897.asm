; DESCRIPTION: Creates a red circular shape at (366, 218) with radius 31.
; PLAN: r0=366(x), r1=218(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 218
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
