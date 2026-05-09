; DESCRIPTION: Draws a magenta rectangle at (162, 121) with width 79 and height 64.
; PLAN: r0=162(x), r1=121(y), r2=79(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 121
LDI r2, 79
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
