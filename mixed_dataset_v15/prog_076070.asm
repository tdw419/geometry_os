; DESCRIPTION: Draws a magenta rectangle at (199, 77) with width 79 and height 58.
; PLAN: r0=199(x), r1=77(y), r2=79(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 77
LDI r2, 79
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
