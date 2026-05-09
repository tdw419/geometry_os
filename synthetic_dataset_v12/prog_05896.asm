; DESCRIPTION: Draws a magenta rectangle at (227, 121) with width 75 and height 77.
; PLAN: r0=227(x), r1=121(y), r2=75(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 121
LDI r2, 75
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
