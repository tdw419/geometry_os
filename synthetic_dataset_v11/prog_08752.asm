; DESCRIPTION: Creates a red circular shape at (89, 143) with radius 49.
; PLAN: r0=89(x), r1=143(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 143
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
