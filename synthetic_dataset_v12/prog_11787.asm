; DESCRIPTION: Draws a red rectangle at (63, 117) with width 89 and height 41.
; PLAN: r0=63(x), r1=117(y), r2=89(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 117
LDI r2, 89
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
