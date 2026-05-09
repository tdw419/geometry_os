; DESCRIPTION: Creates a magenta circular shape at (58, 153) with radius 41.
; PLAN: r0=58(x), r1=153(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 153
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
