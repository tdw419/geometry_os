; DESCRIPTION: Draws a magenta rectangle at (362, 132) with width 25 and height 33.
; PLAN: r0=362(x), r1=132(y), r2=25(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 132
LDI r2, 25
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
