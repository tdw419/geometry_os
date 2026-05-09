; DESCRIPTION: Creates a red circular shape at (146, 170) with radius 43.
; PLAN: r0=146(x), r1=170(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 170
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
