; DESCRIPTION: Draws a magenta rectangle at (37, 132) with width 39 and height 87.
; PLAN: r0=37(x), r1=132(y), r2=39(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 132
LDI r2, 39
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
