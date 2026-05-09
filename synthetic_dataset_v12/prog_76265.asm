; DESCRIPTION: Draws a magenta rectangle at (134, 69) with width 93 and height 118.
; PLAN: r0=134(x), r1=69(y), r2=93(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 69
LDI r2, 93
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
