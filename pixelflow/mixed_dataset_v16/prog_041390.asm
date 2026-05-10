; DESCRIPTION: Draws a magenta rectangle at (156, 113) with width 48 and height 36.
; PLAN: r0=156(x), r1=113(y), r2=48(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 113
LDI r2, 48
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
