; DESCRIPTION: Draws a magenta rectangle at (153, 30) with width 107 and height 98.
; PLAN: r0=153(x), r1=30(y), r2=107(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 30
LDI r2, 107
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
