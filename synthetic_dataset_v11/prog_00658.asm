; DESCRIPTION: Draws a magenta rectangle at (158, 96) with width 28 and height 46.
; PLAN: r0=158(x), r1=96(y), r2=28(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 96
LDI r2, 28
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
