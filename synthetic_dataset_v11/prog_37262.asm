; DESCRIPTION: Creates a red circular shape at (170, 89) with radius 68.
; PLAN: r0=170(x), r1=89(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 89
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
