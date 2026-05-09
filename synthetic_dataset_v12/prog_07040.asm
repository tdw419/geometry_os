; DESCRIPTION: Draws a magenta rectangle at (378, 53) with width 87 and height 107.
; PLAN: r0=378(x), r1=53(y), r2=87(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 53
LDI r2, 87
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
