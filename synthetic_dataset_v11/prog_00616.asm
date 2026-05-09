; DESCRIPTION: Draws a magenta rectangle at (44, 44) with width 85 and height 67.
; PLAN: r0=44(x), r1=44(y), r2=85(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 44
LDI r2, 85
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
