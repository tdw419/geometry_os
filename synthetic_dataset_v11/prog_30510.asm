; DESCRIPTION: Draws a magenta rectangle at (118, 108) with width 18 and height 64.
; PLAN: r0=118(x), r1=108(y), r2=18(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 108
LDI r2, 18
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
