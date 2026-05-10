; DESCRIPTION: Draws a magenta rectangle at (203, 167) with width 95 and height 86.
; PLAN: r0=203(x), r1=167(y), r2=95(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 167
LDI r2, 95
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
