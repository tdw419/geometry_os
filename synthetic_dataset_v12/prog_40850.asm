; DESCRIPTION: Draws a magenta rectangle at (107, 1) with width 41 and height 99.
; PLAN: r0=107(x), r1=1(y), r2=41(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 1
LDI r2, 41
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
