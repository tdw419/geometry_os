; DESCRIPTION: Draws a magenta rectangle at (197, 156) with width 51 and height 90.
; PLAN: r0=197(x), r1=156(y), r2=51(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 156
LDI r2, 51
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
