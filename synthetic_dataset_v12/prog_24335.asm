; DESCRIPTION: Draws a magenta rectangle at (277, 145) with width 66 and height 78.
; PLAN: r0=277(x), r1=145(y), r2=66(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 145
LDI r2, 66
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
