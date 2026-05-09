; DESCRIPTION: Draws a magenta rectangle at (153, 62) with width 32 and height 118.
; PLAN: r0=153(x), r1=62(y), r2=32(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 62
LDI r2, 32
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
