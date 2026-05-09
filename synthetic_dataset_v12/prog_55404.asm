; DESCRIPTION: Draws a magenta rectangle at (207, 20) with width 41 and height 49.
; PLAN: r0=207(x), r1=20(y), r2=41(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 20
LDI r2, 41
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
