; DESCRIPTION: Draws a magenta rectangle at (369, 130) with width 71 and height 114.
; PLAN: r0=369(x), r1=130(y), r2=71(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 130
LDI r2, 71
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
