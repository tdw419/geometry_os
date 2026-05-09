; DESCRIPTION: Creates a red circular shape at (251, 74) with radius 73.
; PLAN: r0=251(x), r1=74(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 74
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
