; DESCRIPTION: Creates a red circular shape at (323, 52) with radius 33.
; PLAN: r0=323(x), r1=52(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 52
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
