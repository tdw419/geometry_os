; DESCRIPTION: Draws a purple rectangle at (127, 114) with width 56 and height 114.
; PLAN: r0=127(x), r1=114(y), r2=56(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 114
LDI r2, 56
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
