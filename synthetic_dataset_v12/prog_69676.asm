; DESCRIPTION: Draws a magenta rectangle at (199, 106) with width 29 and height 79.
; PLAN: r0=199(x), r1=106(y), r2=29(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 106
LDI r2, 29
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
