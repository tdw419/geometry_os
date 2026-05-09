; DESCRIPTION: Creates a red circular shape at (234, 109) with radius 58.
; PLAN: r0=234(x), r1=109(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 109
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
