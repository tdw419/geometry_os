; DESCRIPTION: Draws a magenta rectangle at (125, 12) with width 101 and height 69.
; PLAN: r0=125(x), r1=12(y), r2=101(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 12
LDI r2, 101
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
