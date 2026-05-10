; DESCRIPTION: Draws a blue rectangle at (357, 198) with width 102 and height 114.
; PLAN: r0=357(x), r1=198(y), r2=102(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 198
LDI r2, 102
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
