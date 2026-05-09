; DESCRIPTION: Creates a red circular shape at (147, 81) with radius 36.
; PLAN: r0=147(x), r1=81(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 81
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
