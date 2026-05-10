; DESCRIPTION: Draws a magenta rectangle at (350, 54) with width 35 and height 96.
; PLAN: r0=350(x), r1=54(y), r2=35(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 54
LDI r2, 35
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
