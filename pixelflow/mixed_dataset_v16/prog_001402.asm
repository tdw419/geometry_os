; DESCRIPTION: Draws a magenta rectangle at (246, 135) with width 21 and height 52.
; PLAN: r0=246(x), r1=135(y), r2=21(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 135
LDI r2, 21
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
