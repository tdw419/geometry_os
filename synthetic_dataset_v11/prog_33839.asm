; DESCRIPTION: Draws a magenta rectangle at (90, 47) with width 15 and height 43.
; PLAN: r0=90(x), r1=47(y), r2=15(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 47
LDI r2, 15
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
