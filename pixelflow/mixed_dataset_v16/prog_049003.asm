; DESCRIPTION: Draws a magenta rectangle at (158, 66) with width 27 and height 90.
; PLAN: r0=158(x), r1=66(y), r2=27(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 66
LDI r2, 27
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
