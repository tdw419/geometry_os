; DESCRIPTION: Draws a magenta rectangle at (122, 81) with width 102 and height 117.
; PLAN: r0=122(x), r1=81(y), r2=102(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 81
LDI r2, 102
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
