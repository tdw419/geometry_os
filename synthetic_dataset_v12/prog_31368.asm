; DESCRIPTION: Draws a magenta rectangle at (41, 10) with width 15 and height 72.
; PLAN: r0=41(x), r1=10(y), r2=15(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 10
LDI r2, 15
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
