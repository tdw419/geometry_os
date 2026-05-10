; DESCRIPTION: Draws a magenta rectangle at (415, 113) with width 88 and height 86.
; PLAN: r0=415(x), r1=113(y), r2=88(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 113
LDI r2, 88
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
