; DESCRIPTION: Draws a magenta rectangle at (69, 113) with width 22 and height 58.
; PLAN: r0=69(x), r1=113(y), r2=22(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 113
LDI r2, 22
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
