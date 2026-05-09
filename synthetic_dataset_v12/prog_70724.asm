; DESCRIPTION: Draws a magenta rectangle at (300, 70) with width 89 and height 113.
; PLAN: r0=300(x), r1=70(y), r2=89(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 70
LDI r2, 89
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
