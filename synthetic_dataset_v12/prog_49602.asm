; DESCRIPTION: Draws a magenta rectangle at (327, 70) with width 84 and height 83.
; PLAN: r0=327(x), r1=70(y), r2=84(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 70
LDI r2, 84
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
