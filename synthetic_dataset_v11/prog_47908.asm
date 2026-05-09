; DESCRIPTION: Draws a magenta rectangle at (95, 62) with width 114 and height 74.
; PLAN: r0=95(x), r1=62(y), r2=114(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 62
LDI r2, 114
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
