; DESCRIPTION: Draws a red rectangle at (83, 148) with width 83 and height 41.
; PLAN: r0=83(x), r1=148(y), r2=83(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 148
LDI r2, 83
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
