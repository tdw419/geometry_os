; DESCRIPTION: Draws a magenta rectangle at (16, 12) with width 81 and height 69.
; PLAN: r0=16(x), r1=12(y), r2=81(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 12
LDI r2, 81
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
