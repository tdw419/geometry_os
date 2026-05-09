; DESCRIPTION: Draws a magenta rectangle at (472, 6) with width 28 and height 103.
; PLAN: r0=472(x), r1=6(y), r2=28(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 6
LDI r2, 28
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
