; DESCRIPTION: Draws a magenta rectangle at (381, 174) with width 26 and height 57.
; PLAN: r0=381(x), r1=174(y), r2=26(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 174
LDI r2, 26
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
