; DESCRIPTION: Draws a magenta rectangle at (54, 62) with width 60 and height 19.
; PLAN: r0=54(x), r1=62(y), r2=60(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 62
LDI r2, 60
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
