; DESCRIPTION: Draws a magenta rectangle at (91, 76) with width 97 and height 49.
; PLAN: r0=91(x), r1=76(y), r2=97(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 76
LDI r2, 97
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
