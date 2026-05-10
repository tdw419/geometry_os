; DESCRIPTION: Draws a magenta rectangle at (252, 200) with width 84 and height 48.
; PLAN: r0=252(x), r1=200(y), r2=84(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 200
LDI r2, 84
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
