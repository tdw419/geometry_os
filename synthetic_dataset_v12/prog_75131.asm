; DESCRIPTION: Draws a magenta rectangle at (431, 127) with width 75 and height 18.
; PLAN: r0=431(x), r1=127(y), r2=75(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 127
LDI r2, 75
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
