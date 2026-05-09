; DESCRIPTION: Creates a red circular shape at (344, 145) with radius 71.
; PLAN: r0=344(x), r1=145(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 145
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
