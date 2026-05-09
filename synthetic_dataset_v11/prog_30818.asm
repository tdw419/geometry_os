; DESCRIPTION: Draws a red circle centered at (64, 101) with radius 41.
; PLAN: r0=64(x), r1=101(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 101
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
