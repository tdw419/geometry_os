; DESCRIPTION: Draws a magenta rectangle at (98, 108) with width 65 and height 90.
; PLAN: r0=98(x), r1=108(y), r2=65(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 108
LDI r2, 65
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
