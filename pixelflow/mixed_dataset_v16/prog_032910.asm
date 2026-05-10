; DESCRIPTION: Draws a magenta rectangle at (182, 150) with width 35 and height 43.
; PLAN: r0=182(x), r1=150(y), r2=35(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 150
LDI r2, 35
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
