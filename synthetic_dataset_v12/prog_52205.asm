; DESCRIPTION: Draws a magenta rectangle at (204, 19) with width 117 and height 62.
; PLAN: r0=204(x), r1=19(y), r2=117(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 19
LDI r2, 117
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
