; DESCRIPTION: Draws a magenta rectangle at (458, 118) with width 47 and height 88.
; PLAN: r0=458(x), r1=118(y), r2=47(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 118
LDI r2, 47
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
