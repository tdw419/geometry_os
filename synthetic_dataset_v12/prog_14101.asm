; DESCRIPTION: Creates a red circular shape at (309, 118) with radius 22.
; PLAN: r0=309(x), r1=118(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 118
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
