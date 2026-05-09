; DESCRIPTION: Creates a red circular shape at (188, 184) with radius 26.
; PLAN: r0=188(x), r1=184(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 184
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
