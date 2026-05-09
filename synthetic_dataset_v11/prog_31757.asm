; DESCRIPTION: Draws a magenta rectangle at (20, 15) with width 68 and height 46.
; PLAN: r0=20(x), r1=15(y), r2=68(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 15
LDI r2, 68
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
