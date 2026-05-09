; DESCRIPTION: Draws a magenta rectangle at (135, 186) with width 36 and height 41.
; PLAN: r0=135(x), r1=186(y), r2=36(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 186
LDI r2, 36
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
