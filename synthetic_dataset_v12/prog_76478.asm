; DESCRIPTION: Draws a magenta rectangle at (29, 67) with width 65 and height 100.
; PLAN: r0=29(x), r1=67(y), r2=65(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 67
LDI r2, 65
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
