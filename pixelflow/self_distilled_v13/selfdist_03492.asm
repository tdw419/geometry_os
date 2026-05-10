; DESCRIPTION: Draws a magenta rectangle at (365, 167) with width 88 and height 101.
; PLAN: r0=365(x), r1=167(y), r2=88(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 167
LDI r2, 88
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
