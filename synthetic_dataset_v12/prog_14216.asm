; DESCRIPTION: Draws a magenta rectangle at (136, 197) with width 62 and height 28.
; PLAN: r0=136(x), r1=197(y), r2=62(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 197
LDI r2, 62
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
