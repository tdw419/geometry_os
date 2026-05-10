; DESCRIPTION: Draws a magenta rectangle at (172, 167) with width 62 and height 29.
; PLAN: r0=172(x), r1=167(y), r2=62(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 167
LDI r2, 62
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
