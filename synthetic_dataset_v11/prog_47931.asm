; DESCRIPTION: Creates a red circular shape at (105, 179) with radius 63.
; PLAN: r0=105(x), r1=179(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 179
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
