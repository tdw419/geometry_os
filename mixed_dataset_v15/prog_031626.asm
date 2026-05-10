; DESCRIPTION: Draws a magenta rectangle at (181, 190) with width 51 and height 99.
; PLAN: r0=181(x), r1=190(y), r2=51(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 190
LDI r2, 51
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
