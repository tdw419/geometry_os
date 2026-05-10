; DESCRIPTION: Draws a magenta rectangle at (378, 183) with width 44 and height 68.
; PLAN: r0=378(x), r1=183(y), r2=44(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 183
LDI r2, 44
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
