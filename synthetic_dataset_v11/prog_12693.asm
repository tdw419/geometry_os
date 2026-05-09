; DESCRIPTION: Creates a red circular shape at (162, 188) with radius 57.
; PLAN: r0=162(x), r1=188(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 188
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
