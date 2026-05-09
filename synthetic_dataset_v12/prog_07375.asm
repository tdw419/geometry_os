; DESCRIPTION: Draws a magenta rectangle at (58, 167) with width 88 and height 28.
; PLAN: r0=58(x), r1=167(y), r2=88(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 167
LDI r2, 88
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
