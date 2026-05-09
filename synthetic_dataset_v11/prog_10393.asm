; DESCRIPTION: Draws a magenta rectangle at (69, 66) with width 70 and height 96.
; PLAN: r0=69(x), r1=66(y), r2=70(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 66
LDI r2, 70
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
