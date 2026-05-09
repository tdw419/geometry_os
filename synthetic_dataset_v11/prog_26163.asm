; DESCRIPTION: Draws a magenta rectangle at (204, 231) with width 34 and height 17.
; PLAN: r0=204(x), r1=231(y), r2=34(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 231
LDI r2, 34
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
