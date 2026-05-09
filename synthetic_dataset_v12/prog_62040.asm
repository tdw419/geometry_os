; DESCRIPTION: Draws a magenta rectangle at (1, 127) with width 86 and height 99.
; PLAN: r0=1(x), r1=127(y), r2=86(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 127
LDI r2, 86
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
