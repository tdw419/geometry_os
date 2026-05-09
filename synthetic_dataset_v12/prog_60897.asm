; DESCRIPTION: Draws a magenta rectangle at (237, 114) with width 101 and height 35.
; PLAN: r0=237(x), r1=114(y), r2=101(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 114
LDI r2, 101
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
