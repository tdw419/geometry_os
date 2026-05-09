; DESCRIPTION: Draws a red circle centered at (55, 100) with radius 41.
; PLAN: r0=55(x), r1=100(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 100
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
