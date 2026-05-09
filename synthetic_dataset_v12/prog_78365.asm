; DESCRIPTION: Draws a magenta rectangle at (77, 68) with width 110 and height 109.
; PLAN: r0=77(x), r1=68(y), r2=110(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 68
LDI r2, 110
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
