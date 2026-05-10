; DESCRIPTION: Creates a red circular shape at (469, 207) with radius 28.
; PLAN: r0=469(x), r1=207(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 207
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
