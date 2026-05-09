; DESCRIPTION: Draws a magenta rectangle at (276, 23) with width 108 and height 107.
; PLAN: r0=276(x), r1=23(y), r2=108(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 23
LDI r2, 108
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
