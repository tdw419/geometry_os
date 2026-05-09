; DESCRIPTION: Draws a magenta rectangle at (86, 117) with width 101 and height 57.
; PLAN: r0=86(x), r1=117(y), r2=101(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 117
LDI r2, 101
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
