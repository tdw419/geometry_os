; DESCRIPTION: Draws a magenta rectangle at (29, 138) with width 15 and height 68.
; PLAN: r0=29(x), r1=138(y), r2=15(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 138
LDI r2, 15
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
