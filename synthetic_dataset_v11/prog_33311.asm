; DESCRIPTION: Draws a magenta rectangle at (217, 110) with width 39 and height 114.
; PLAN: r0=217(x), r1=110(y), r2=39(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 110
LDI r2, 39
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
