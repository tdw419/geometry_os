; DESCRIPTION: Draws a magenta rectangle at (200, 16) with width 48 and height 84.
; PLAN: r0=200(x), r1=16(y), r2=48(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 16
LDI r2, 48
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
