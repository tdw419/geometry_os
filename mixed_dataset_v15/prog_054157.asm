; DESCRIPTION: Draws a magenta rectangle at (207, 70) with width 15 and height 51.
; PLAN: r0=207(x), r1=70(y), r2=15(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 70
LDI r2, 15
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
