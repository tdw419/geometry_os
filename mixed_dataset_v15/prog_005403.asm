; DESCRIPTION: Draws a magenta rectangle at (14, 49) with width 96 and height 24.
; PLAN: r0=14(x), r1=49(y), r2=96(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 49
LDI r2, 96
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
