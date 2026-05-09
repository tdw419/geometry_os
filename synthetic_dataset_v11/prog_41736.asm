; DESCRIPTION: Draws a magenta rectangle at (150, 118) with width 38 and height 90.
; PLAN: r0=150(x), r1=118(y), r2=38(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 118
LDI r2, 38
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
