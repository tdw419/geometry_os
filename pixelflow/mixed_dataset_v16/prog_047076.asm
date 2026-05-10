; DESCRIPTION: Draws a magenta rectangle at (369, 125) with width 17 and height 113.
; PLAN: r0=369(x), r1=125(y), r2=17(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 125
LDI r2, 17
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
