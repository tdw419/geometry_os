; DESCRIPTION: Draws a magenta rectangle at (118, 91) with width 44 and height 47.
; PLAN: r0=118(x), r1=91(y), r2=44(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 91
LDI r2, 44
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
