; DESCRIPTION: Draws a magenta rectangle at (68, 94) with width 11 and height 108.
; PLAN: r0=68(x), r1=94(y), r2=11(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 94
LDI r2, 11
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
