; DESCRIPTION: Draws a red rectangle at (265, 120) with width 110 and height 41.
; PLAN: r0=265(x), r1=120(y), r2=110(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 120
LDI r2, 110
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
