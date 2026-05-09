; DESCRIPTION: Draws a magenta rectangle at (140, 137) with width 39 and height 56.
; PLAN: r0=140(x), r1=137(y), r2=39(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 137
LDI r2, 39
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
