; DESCRIPTION: Draws a red circle centered at (301, 122) with radius 41.
; PLAN: r0=301(x), r1=122(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 122
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
