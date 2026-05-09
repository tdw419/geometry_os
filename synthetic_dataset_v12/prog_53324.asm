; DESCRIPTION: Draws a magenta rectangle at (122, 92) with width 74 and height 79.
; PLAN: r0=122(x), r1=92(y), r2=74(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 92
LDI r2, 74
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
