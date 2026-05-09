; DESCRIPTION: Draws a magenta rectangle at (69, 122) with width 105 and height 13.
; PLAN: r0=69(x), r1=122(y), r2=105(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 122
LDI r2, 105
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
