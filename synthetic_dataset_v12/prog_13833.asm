; DESCRIPTION: Draws a magenta rectangle at (103, 158) with width 24 and height 29.
; PLAN: r0=103(x), r1=158(y), r2=24(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 158
LDI r2, 24
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
