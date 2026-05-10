; DESCRIPTION: Draws a magenta rectangle at (217, 113) with width 56 and height 24.
; PLAN: r0=217(x), r1=113(y), r2=56(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 113
LDI r2, 56
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
