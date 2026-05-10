; DESCRIPTION: Creates a red circular shape at (96, 31) with radius 20.
; PLAN: r0=96(x), r1=31(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 31
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
