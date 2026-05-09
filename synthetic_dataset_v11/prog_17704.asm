; DESCRIPTION: Draws a magenta rectangle at (132, 8) with width 70 and height 61.
; PLAN: r0=132(x), r1=8(y), r2=70(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 8
LDI r2, 70
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
