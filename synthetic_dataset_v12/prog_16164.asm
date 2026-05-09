; DESCRIPTION: Draws a magenta rectangle at (141, 133) with width 26 and height 78.
; PLAN: r0=141(x), r1=133(y), r2=26(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 133
LDI r2, 26
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
