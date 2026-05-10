; DESCRIPTION: Draws a magenta rectangle at (376, 122) with width 107 and height 108.
; PLAN: r0=376(x), r1=122(y), r2=107(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 122
LDI r2, 107
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
