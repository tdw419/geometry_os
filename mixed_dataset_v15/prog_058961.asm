; DESCRIPTION: Draws a magenta rectangle at (366, 77) with width 82 and height 110.
; PLAN: r0=366(x), r1=77(y), r2=82(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 77
LDI r2, 82
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
