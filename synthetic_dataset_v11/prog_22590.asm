; DESCRIPTION: Draws a magenta rectangle at (153, 48) with width 89 and height 107.
; PLAN: r0=153(x), r1=48(y), r2=89(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 48
LDI r2, 89
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
