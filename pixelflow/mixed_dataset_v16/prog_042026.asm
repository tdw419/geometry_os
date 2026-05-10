; DESCRIPTION: Draws a magenta rectangle at (106, 4) with width 57 and height 38.
; PLAN: r0=106(x), r1=4(y), r2=57(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 4
LDI r2, 57
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
