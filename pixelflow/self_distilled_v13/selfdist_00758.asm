; DESCRIPTION: Draws a magenta rectangle at (132, 37) with width 26 and height 72.
; PLAN: r0=132(x), r1=37(y), r2=26(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 37
LDI r2, 26
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
