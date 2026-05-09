; DESCRIPTION: Creates a red circular shape at (68, 75) with radius 32.
; PLAN: r0=68(x), r1=75(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 75
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
