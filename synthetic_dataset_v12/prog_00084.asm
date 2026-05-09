; DESCRIPTION: Draws a magenta rectangle at (230, 135) with width 103 and height 47.
; PLAN: r0=230(x), r1=135(y), r2=103(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 135
LDI r2, 103
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
