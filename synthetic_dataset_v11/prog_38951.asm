; DESCRIPTION: Draws a magenta rectangle at (120, 88) with width 118 and height 16.
; PLAN: r0=120(x), r1=88(y), r2=118(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 88
LDI r2, 118
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
