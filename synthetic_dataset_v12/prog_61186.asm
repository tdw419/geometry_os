; DESCRIPTION: Draws a magenta rectangle at (113, 127) with width 43 and height 64.
; PLAN: r0=113(x), r1=127(y), r2=43(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 127
LDI r2, 43
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
