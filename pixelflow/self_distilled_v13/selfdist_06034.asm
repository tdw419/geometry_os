; DESCRIPTION: Draws a magenta rectangle at (5, 127) with width 105 and height 67.
; PLAN: r0=5(x), r1=127(y), r2=105(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 127
LDI r2, 105
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
