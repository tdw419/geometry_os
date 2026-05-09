; DESCRIPTION: Draws a magenta rectangle at (52, 113) with width 84 and height 19.
; PLAN: r0=52(x), r1=113(y), r2=84(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 113
LDI r2, 84
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
