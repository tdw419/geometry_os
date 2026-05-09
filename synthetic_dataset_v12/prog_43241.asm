; DESCRIPTION: Draws a magenta rectangle at (91, 37) with width 115 and height 94.
; PLAN: r0=91(x), r1=37(y), r2=115(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 37
LDI r2, 115
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
