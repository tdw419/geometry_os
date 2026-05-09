; DESCRIPTION: Draws a magenta rectangle at (68, 178) with width 84 and height 71.
; PLAN: r0=68(x), r1=178(y), r2=84(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 178
LDI r2, 84
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
