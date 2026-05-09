; DESCRIPTION: Draws a magenta rectangle at (10, 61) with width 10 and height 118.
; PLAN: r0=10(x), r1=61(y), r2=10(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 61
LDI r2, 10
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
