; DESCRIPTION: Draws a magenta rectangle at (64, 60) with width 84 and height 66.
; PLAN: r0=64(x), r1=60(y), r2=84(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 60
LDI r2, 84
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
