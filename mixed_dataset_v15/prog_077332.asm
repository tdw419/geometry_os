; DESCRIPTION: Draws a magenta rectangle at (43, 33) with width 96 and height 113.
; PLAN: r0=43(x), r1=33(y), r2=96(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 33
LDI r2, 96
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
