; DESCRIPTION: Draws a magenta rectangle at (118, 36) with width 73 and height 64.
; PLAN: r0=118(x), r1=36(y), r2=73(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 36
LDI r2, 73
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
