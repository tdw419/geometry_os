; DESCRIPTION: Draws a magenta rectangle at (155, 130) with width 51 and height 114.
; PLAN: r0=155(x), r1=130(y), r2=51(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 130
LDI r2, 51
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
