; DESCRIPTION: Creates a red circular shape at (234, 163) with radius 69.
; PLAN: r0=234(x), r1=163(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 163
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
