; DESCRIPTION: Draws a magenta rectangle at (235, 6) with width 107 and height 38.
; PLAN: r0=235(x), r1=6(y), r2=107(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 6
LDI r2, 107
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
