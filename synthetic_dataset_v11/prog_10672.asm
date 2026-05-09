; DESCRIPTION: Draws a magenta rectangle at (49, 189) with width 67 and height 56.
; PLAN: r0=49(x), r1=189(y), r2=67(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 189
LDI r2, 67
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
