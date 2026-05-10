; DESCRIPTION: Draws a magenta rectangle at (121, 55) with width 96 and height 114.
; PLAN: r0=121(x), r1=55(y), r2=96(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 55
LDI r2, 96
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
