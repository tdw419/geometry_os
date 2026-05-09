; DESCRIPTION: Creates a red circular shape at (117, 101) with radius 12.
; PLAN: r0=117(x), r1=101(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 101
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
