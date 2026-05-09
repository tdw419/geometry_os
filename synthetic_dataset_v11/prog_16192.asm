; DESCRIPTION: Draws a magenta rectangle at (127, 116) with width 87 and height 67.
; PLAN: r0=127(x), r1=116(y), r2=87(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 116
LDI r2, 87
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
