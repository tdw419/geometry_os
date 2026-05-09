; DESCRIPTION: Draws a magenta rectangle at (261, 85) with width 105 and height 15.
; PLAN: r0=261(x), r1=85(y), r2=105(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 85
LDI r2, 105
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
