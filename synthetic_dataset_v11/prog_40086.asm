; DESCRIPTION: Draws a magenta rectangle at (55, 97) with width 14 and height 111.
; PLAN: r0=55(x), r1=97(y), r2=14(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 97
LDI r2, 14
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
