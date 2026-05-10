; DESCRIPTION: Draws a magenta rectangle at (98, 75) with width 108 and height 40.
; PLAN: r0=98(x), r1=75(y), r2=108(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 75
LDI r2, 108
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
