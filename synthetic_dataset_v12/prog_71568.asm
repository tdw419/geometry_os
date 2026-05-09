; DESCRIPTION: Draws a magenta rectangle at (232, 42) with width 26 and height 94.
; PLAN: r0=232(x), r1=42(y), r2=26(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 42
LDI r2, 26
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
