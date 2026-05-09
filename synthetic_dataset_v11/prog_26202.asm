; DESCRIPTION: Draws a magenta rectangle at (50, 97) with width 118 and height 82.
; PLAN: r0=50(x), r1=97(y), r2=118(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 97
LDI r2, 118
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
