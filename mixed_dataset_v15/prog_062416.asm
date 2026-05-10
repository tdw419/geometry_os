; DESCRIPTION: Draws a magenta rectangle at (369, 0) with width 85 and height 107.
; PLAN: r0=369(x), r1=0(y), r2=85(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 0
LDI r2, 85
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
