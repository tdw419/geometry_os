; DESCRIPTION: Draws a magenta rectangle at (30, 100) with width 113 and height 73.
; PLAN: r0=30(x), r1=100(y), r2=113(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 100
LDI r2, 113
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
