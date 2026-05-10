; DESCRIPTION: Draws a magenta rectangle at (320, 84) with width 81 and height 98.
; PLAN: r0=320(x), r1=84(y), r2=81(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 84
LDI r2, 81
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
