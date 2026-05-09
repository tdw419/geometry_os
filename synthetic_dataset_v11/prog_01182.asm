; DESCRIPTION: Draws a magenta rectangle at (20, 76) with width 83 and height 62.
; PLAN: r0=20(x), r1=76(y), r2=83(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 76
LDI r2, 83
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
