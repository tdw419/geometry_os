; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.
; PLAN: r0=50(x), r1=185(y), r2=41(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 50
LDI r2, 105
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT