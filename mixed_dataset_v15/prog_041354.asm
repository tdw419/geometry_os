; DESCRIPTION: Creates a red circular shape at (389, 117) with radius 31.
; PLAN: r0=389(x), r1=117(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 117
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
