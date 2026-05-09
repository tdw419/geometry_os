; DESCRIPTION: Draws a magenta rectangle at (13, 103) with width 46 and height 84.
; PLAN: r0=13(x), r1=103(y), r2=46(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 103
LDI r2, 46
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
