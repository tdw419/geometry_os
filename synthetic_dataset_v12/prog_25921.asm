; DESCRIPTION: Draws a magenta rectangle at (183, 9) with width 106 and height 20.
; PLAN: r0=183(x), r1=9(y), r2=106(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 9
LDI r2, 106
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
