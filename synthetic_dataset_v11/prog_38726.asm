; DESCRIPTION: Draws a magenta rectangle at (107, 110) with width 110 and height 82.
; PLAN: r0=107(x), r1=110(y), r2=110(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 110
LDI r2, 110
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
