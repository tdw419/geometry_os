; DESCRIPTION: Draws a magenta rectangle at (29, 118) with width 78 and height 111.
; PLAN: r0=29(x), r1=118(y), r2=78(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 118
LDI r2, 78
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
