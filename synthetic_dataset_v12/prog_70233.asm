; DESCRIPTION: Draws a magenta rectangle at (41, 30) with width 19 and height 54.
; PLAN: r0=41(x), r1=30(y), r2=19(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 30
LDI r2, 19
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
