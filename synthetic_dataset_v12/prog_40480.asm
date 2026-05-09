; DESCRIPTION: Draws a magenta rectangle at (135, 25) with width 41 and height 112.
; PLAN: r0=135(x), r1=25(y), r2=41(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 25
LDI r2, 41
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
