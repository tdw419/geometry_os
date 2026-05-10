; DESCRIPTION: Draws a magenta rectangle at (239, 12) with width 101 and height 94.
; PLAN: r0=239(x), r1=12(y), r2=101(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 12
LDI r2, 101
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
