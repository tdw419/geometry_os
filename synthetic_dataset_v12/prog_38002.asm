; DESCRIPTION: Draws a magenta rectangle at (134, 187) with width 108 and height 17.
; PLAN: r0=134(x), r1=187(y), r2=108(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 187
LDI r2, 108
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
