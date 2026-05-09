; DESCRIPTION: Creates a red circular shape at (288, 172) with radius 49.
; PLAN: r0=288(x), r1=172(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 172
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
