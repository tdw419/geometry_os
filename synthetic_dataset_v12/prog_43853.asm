; DESCRIPTION: Draws a magenta rectangle at (319, 204) with width 20 and height 40.
; PLAN: r0=319(x), r1=204(y), r2=20(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 204
LDI r2, 20
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
