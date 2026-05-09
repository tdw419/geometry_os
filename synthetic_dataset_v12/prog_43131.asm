; DESCRIPTION: Draws a red rectangle at (41, 75) with width 95 and height 82.
; PLAN: r0=41(x), r1=75(y), r2=95(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 75
LDI r2, 95
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
