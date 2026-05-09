; DESCRIPTION: Draws a magenta rectangle at (96, 63) with width 117 and height 44.
; PLAN: r0=96(x), r1=63(y), r2=117(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 63
LDI r2, 117
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
