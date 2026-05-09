; DESCRIPTION: Creates a red circular shape at (106, 161) with radius 73.
; PLAN: r0=106(x), r1=161(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 161
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
