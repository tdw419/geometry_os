; DESCRIPTION: Draws a magenta rectangle at (204, 80) with width 48 and height 43.
; PLAN: r0=204(x), r1=80(y), r2=48(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 80
LDI r2, 48
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
