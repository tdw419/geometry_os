; DESCRIPTION: Draws a magenta rectangle at (391, 15) with width 25 and height 81.
; PLAN: r0=391(x), r1=15(y), r2=25(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 15
LDI r2, 25
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
