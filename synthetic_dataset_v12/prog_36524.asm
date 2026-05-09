; DESCRIPTION: Draws a magenta rectangle at (29, 30) with width 113 and height 35.
; PLAN: r0=29(x), r1=30(y), r2=113(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 30
LDI r2, 113
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
