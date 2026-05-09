; DESCRIPTION: Draws a magenta rectangle at (216, 64) with width 38 and height 87.
; PLAN: r0=216(x), r1=64(y), r2=38(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 64
LDI r2, 38
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
