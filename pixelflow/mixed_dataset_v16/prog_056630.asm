; DESCRIPTION: Draws a magenta rectangle at (29, 43) with width 38 and height 14.
; PLAN: r0=29(x), r1=43(y), r2=38(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 43
LDI r2, 38
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
