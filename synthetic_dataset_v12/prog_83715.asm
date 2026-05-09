; DESCRIPTION: Creates a red circular shape at (137, 71) with radius 32.
; PLAN: r0=137(x), r1=71(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 71
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
