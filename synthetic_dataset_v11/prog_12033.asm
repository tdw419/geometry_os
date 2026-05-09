; DESCRIPTION: Draws a magenta rectangle at (80, 160) with width 96 and height 46.
; PLAN: r0=80(x), r1=160(y), r2=96(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 160
LDI r2, 96
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
