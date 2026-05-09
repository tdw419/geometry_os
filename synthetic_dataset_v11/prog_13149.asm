; DESCRIPTION: Draws a magenta rectangle at (205, 97) with width 34 and height 82.
; PLAN: r0=205(x), r1=97(y), r2=34(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 97
LDI r2, 34
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
