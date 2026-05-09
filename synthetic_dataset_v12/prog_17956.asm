; DESCRIPTION: Draws a magenta rectangle at (220, 127) with width 84 and height 77.
; PLAN: r0=220(x), r1=127(y), r2=84(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 127
LDI r2, 84
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
