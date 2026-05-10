; DESCRIPTION: Draws a magenta rectangle at (134, 0) with width 12 and height 84.
; PLAN: r0=134(x), r1=0(y), r2=12(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 0
LDI r2, 12
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
