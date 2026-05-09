; DESCRIPTION: Draws a magenta rectangle at (61, 133) with width 90 and height 66.
; PLAN: r0=61(x), r1=133(y), r2=90(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 133
LDI r2, 90
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
