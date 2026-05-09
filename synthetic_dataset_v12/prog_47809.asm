; DESCRIPTION: Draws a magenta rectangle at (15, 91) with width 68 and height 98.
; PLAN: r0=15(x), r1=91(y), r2=68(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 91
LDI r2, 68
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
