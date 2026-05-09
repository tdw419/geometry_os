; DESCRIPTION: Creates a red circular shape at (430, 94) with radius 73.
; PLAN: r0=430(x), r1=94(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 94
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
