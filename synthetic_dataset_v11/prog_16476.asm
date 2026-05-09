; DESCRIPTION: Draws a magenta rectangle at (106, 220) with width 84 and height 30.
; PLAN: r0=106(x), r1=220(y), r2=84(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 220
LDI r2, 84
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
