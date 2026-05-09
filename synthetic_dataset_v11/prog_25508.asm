; DESCRIPTION: Creates a red circular shape at (179, 138) with radius 15.
; PLAN: r0=179(x), r1=138(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 138
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
