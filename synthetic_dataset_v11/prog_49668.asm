; DESCRIPTION: Creates a magenta circular shape at (102, 163) with radius 41.
; PLAN: r0=102(x), r1=163(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 163
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
