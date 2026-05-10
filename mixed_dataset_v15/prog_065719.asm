; DESCRIPTION: Creates a red circular shape at (447, 49) with radius 36.
; PLAN: r0=447(x), r1=49(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 49
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
