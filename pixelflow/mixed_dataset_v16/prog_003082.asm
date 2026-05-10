; DESCRIPTION: Draws a magenta rectangle at (296, 74) with width 62 and height 49.
; PLAN: r0=296(x), r1=74(y), r2=62(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 74
LDI r2, 62
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
