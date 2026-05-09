; DESCRIPTION: Draws a magenta rectangle at (408, 133) with width 99 and height 14.
; PLAN: r0=408(x), r1=133(y), r2=99(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 133
LDI r2, 99
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
