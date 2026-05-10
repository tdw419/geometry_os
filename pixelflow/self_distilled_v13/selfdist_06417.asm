; DESCRIPTION: Draws a magenta rectangle at (103, 9) with width 17 and height 20.
; PLAN: r0=103(x), r1=9(y), r2=17(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 9
LDI r2, 17
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
