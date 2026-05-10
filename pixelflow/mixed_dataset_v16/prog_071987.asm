; DESCRIPTION: Draws a magenta rectangle at (353, 54) with width 55 and height 36.
; PLAN: r0=353(x), r1=54(y), r2=55(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 54
LDI r2, 55
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
