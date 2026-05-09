; DESCRIPTION: Draws a magenta rectangle at (69, 96) with width 67 and height 46.
; PLAN: r0=69(x), r1=96(y), r2=67(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 96
LDI r2, 67
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
